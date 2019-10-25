#Lookdev kit 2.0 by Dusan Kovic - www.dusankovic.com
#Special thanks to Aleksandar Kocic - www.aleksandarkocic.com for being great advisor on this project
import maya.cmds as cmds
import mtoa.utils as mutils
import mtoa.core as core
import os
import subprocess
import sys

LOOKDEV_KIT_FOLDER = os.path.dirname(os.path.abspath(__file__))
MINI_HDR_FOLDER = os.path.join(LOOKDEV_KIT_FOLDER, "sourceimages", "mini").replace("\\", "/")
TEX_FOLDER = os.path.join(LOOKDEV_KIT_FOLDER, "sourceimages").replace("\\", "/")
HDR_FOLDER = os.path.join(TEX_FOLDER, "hdr").replace("\\", "/")

#COMMANDS

def LDVbutton(*args):
    if cmds.namespace(exists='dk_Ldv') == True:
        cmds.warning( "Lookdev kit is already loaded" )
        return
    if cmds.namespace(exists='mac') == True:
        createLDV()
        cmds.parent("mac:macbeth_spheres_grp", "dk_Ldv:lookdev_ctrl_grp")
        cmds.select(clear=True)
    if cmds.namespace(exists='dk_turn') == True:
        createLDV()
        cmds.parent("dk_turn:turntable_grp", "dk_Ldv:lookdevkit_grp")
        cmds.select(clear=True)
    else:
        createLDV()

def createLDV(*args):
    cmds.namespace(add='dk_Ldv')
    cmds.namespace(set=':dk_Ldv')
    LDVgroup = cmds.group(name = 'lookdevkit_grp', empty=True)
    LDVctrlgroup = cmds.group(name = 'lookdev_ctrl_grp', empty=True)
    cmds.parent(LDVctrlgroup, LDVgroup)
    skydome = mutils.createLocator('aiSkyDomeLight', asLight=True)
    sky_name = cmds.rename(skydome[1], 'aiSkydome')
    skydome_shape = cmds.listRelatives(sky_name, shapes=True)
    cmds.addAttr(skydome_shape[0], longName="rotOffset", min=0, max=360,defaultValue=0, attributeType="double"  )
    hdrtx = cmds.getFileList( folder=HDR_FOLDER, filespec='*.tx')
    hdrskynum = len(hdrtx) 
    cmds.addAttr(skydome_shape[0], longName="hdrsl", min=1, max=hdrskynum, defaultValue=1, attributeType="long"  )
    cmds.setAttr('dk_Ldv:aiSkydomeShape.aiSamples', 3)
    value=cmds.floatSliderGrp('exp', query=True, value=True)
    cmds.setAttr('dk_Ldv:aiSkydomeShape.exposure', value)
    cmds.setAttr('dk_Ldv:aiSkydomeShape.skyRadius', 0)
    cmds.parent(sky_name, LDVctrlgroup)
    imageNode = core.createArnoldNode('aiImage', name = 'hdrTextures')
    hdr_num = cmds.intSliderGrp('hdrSw', query=True, value=True)
    file = cmds.getFileList( folder=HDR_FOLDER , filespec='*.tx' )

    if len(file) == 0:
        new_hdr = os.path.join(TEX_FOLDER , "no_prev.tx").replace("\\", "/")
    else:
        new_hdr = os.path.join(HDR_FOLDER , file[hdr_num-1]).replace("\\", "/")

    cmds.setAttr("dk_Ldv:hdrTextures" + '.filename', new_hdr, type = "string")
    cmds.setAttr(imageNode + '.autoTx',0)
    cmds.connectAttr(imageNode + '.outColor', skydome_shape[0] + '.color', force=True)
    shCatch = cmds.polyPlane(n='shadowCatcher', w=900, h=900, sx=10, sy=10, cuv=2, ax=[0,1,0], ch=False)[0]
    shadowStr = cmds.shadingNode('aiShadowMatte', asShader=True)
    shadowMatte = cmds.rename(shadowStr, 'aiShadow')
    cmds.select( shCatch )
    cmds.hyperShade(assign=shadowMatte)
    cmds.parent(shCatch, LDVctrlgroup)
    cmds.setAttr(shCatch + ".overrideEnabled", 1)
    cmds.setAttr(shCatch + ".overrideDisplayType", 2)

    #camera
    cam = cmds.camera( 
        focalLength=50, 
        centerOfInterest=5, 
        lensSqueezeRatio=1, 
        cameraScale=1,
        horizontalFilmAperture=1.41732,
        horizontalFilmOffset=0,
        verticalFilmAperture=0.94488,
        verticalFilmOffset=0,
        filmFit="Fill",
        overscan=1.2,
        motionBlur=0,
        shutterAngle=144,
        nearClipPlane=1,
        farClipPlane=1000000,
        orthographic=0,
        orthographicWidth=30,
        panZoomEnabled=0,
        horizontalPan=0,
        verticalPan=0,
        zoom=1,
        displayGateMask=1,
        displayResolution=1,
        )

    cmds.setAttr(cam[0] + ".displayGateMaskColor", 0.1,0.1,0.1, type="double3")
    cmds.setAttr(cam[0] + ".translateY", 195)
    cmds.setAttr(cam[0] + ".translateZ", 550)
    cmds.setAttr(cam[0] + ".rotateX", -10)
    cmds.setAttr(cam[0] + ".locatorScale", 15)
    cmds.setAttr(cam[0] + ".displayCameraFrustum", 1)
    cmds.parent(cam[0], "dk_Ldv:lookdev_ctrl_grp")

    #create global ctrl
    ldvCtrl = cmds.curve(name="ldvGlobal_ctrl", degree=1, point=[(-500, 0, 500), (-500, 0, -500), (500, 0, -500), (500, 0, 500), (-500, 0, 500)] )
    cmds.parent(ldvCtrl, LDVgroup)
    cmds.scaleConstraint(ldvCtrl, LDVctrlgroup, maintainOffset=True, weight=1)

    #remove and lock attributes
    cmds.setAttr(sky_name + ".translateX", keyable=False)
    cmds.setAttr(sky_name + ".translateY", keyable=False)
    cmds.setAttr(sky_name + ".translateZ", keyable=False)
    cmds.setAttr(sky_name + ".rotateX", keyable=False)
    cmds.setAttr(sky_name + ".rotateY", keyable=False)
    cmds.setAttr(sky_name + ".rotateZ", keyable=False)
    LDVgrplist = [LDVgroup, LDVctrlgroup, shCatch, ldvCtrl]
    for each in LDVgrplist:
        cmds.setAttr(each + ".translateX", keyable=False, lock=True)
        cmds.setAttr(each + ".translateY", keyable=False, lock=True)
        cmds.setAttr(each + ".translateZ", keyable=False, lock=True)
        cmds.setAttr(each + ".rotateX", keyable=False, lock=True)
        cmds.setAttr(each + ".rotateY", keyable=False, lock=True)
        cmds.setAttr(each + ".rotateZ", keyable=False, lock=True)

    cmds.namespace(set=':')
    cmds.select(clear=True)

def removeLDV(*args):
    cmds.namespace(set=':')
    if cmds.namespace(exists='dk_Ldv') == False:
        cmds.warning( "Nothing to remove" )
        return
    if cmds.namespace(exists='dk_Ldv') == True:
        cmds.namespace(removeNamespace='dk_Ldv', deleteNamespaceContent=True)
    if cmds.namespace(exists='mac') == True:
        cmds.namespace(removeNamespace='mac', deleteNamespaceContent=True)
    if cmds.namespace(exists='dk_turn') == True:
        cmds.namespace(removeNamespace='dk_turn', deleteNamespaceContent=True)
    if cmds.namespace(exists='dk_bake') == True:
        cmds.namespace(removeNamespace='dk_bake', deleteNamespaceContent=True)
        
def Macbutton(*args):
    if cmds.namespace(exists=':mac') == True:
        cmds.warning( "Macbeth chart and spheres are already loaded" )
        return
    if cmds.namespace(exists='dk_Ldv') == True:
        createMAC()
        cmds.parent("mac:macbeth_spheres_grp", "dk_Ldv:lookdev_ctrl_grp")
        cmds.select(clear=True)
    if cmds.namespace(exists='dk_Ldv') == False:
        createMAC()

def createMAC(*args):
    cmds.namespace(add='mac')
    cmds.namespace(set=':mac')
    macbeth_data = [
        {
            "row": 1,
            "column": 1,
            "name": "Patch 01 Dark Skin",
            "base_color": (0.13574, 0.08508, 0.05844),
        },
        {
            "row": 1,
            "column": 2,
            "name": "Patch 02 Light Skin",
            "base_color": (0.44727, 0.29639, 0.22607),
        },
        {
            "row": 1,
            "column": 3,
            "name": "Patch 03 Blue Sky",
            "base_color": (0.14404, 0.18530, 0.30762),
        },
        {
            "row": 1,
            "column": 4,
            "name": "Patch 04 Foliage",
            "base_color": (0.11804, 0.14587, 0.06372),
        },
        {
            "row": 1,
            "column": 5,
            "name": "Patch 05 Blue Flower",
            "base_color": (0.23254, 0.21704, 0.39697),
        },
        {
            "row": 1,
            "column": 6,
            "name": "Patch 06 Bluish Green",
            "base_color": (0.26196, 0.47803, 0.41626),
        },
        {
            "row": 2,
            "column": 1,
            "name": "Patch 07 Orange",
            "base_color": (0.52686, 0.23767, 0.06519),
        },
        {
            "row": 2,
            "column": 2,
            "name": "Patch 08 Purplish Blue",
            "base_color": (0.08972, 0.10303, 0.34717),
        },
        {
            "row": 2,
            "column": 3,
            "name": "Patch 09 Moderate Red",
            "base_color": (0.37646, 0.11469, 0.11987),
        },
        {
            "row": 2,
            "column": 4,
            "name": "Patch 10 Purple",
            "base_color": (0.08813, 0.04837, 0.12622),
        },
        {
            "row": 2,
            "column": 5,
            "name": "Patch 11 Yellow Green",
            "base_color": (0.37329, 0.47803, 0.10223),
        },
        {
            "row": 2,
            "column": 6,
            "name": "Patch 12 Orange Yellow",
            "base_color": (0.59424, 0.38135, 0.07593),
        },
        {
            "row": 3,
            "column": 1,
            "name": "Patch 13 Blue",
            "base_color": (0.04327, 0.04965, 0.25073),
        },
        {
            "row": 3,
            "column": 2,
            "name": "Patch 14 Green",
            "base_color": (0.12939, 0.27075, 0.08832),
        },
        {
            "row": 3,
            "column": 3,
            "name": "Patch 15 Red",
            "base_color": (0.28809, 0.06543, 0.04855),
        },
        {
            "row": 3,
            "column": 4,
            "name": "Patch 16 Yellow",
            "base_color": (0.70947, 0.58350, 0.08929),
        },
        {
            "row": 3,
            "column": 5,
            "name": "Patch 17 Magenta",
            "base_color": (0.36133, 0.11279, 0.26929),
        },
        {
            "row": 3,
            "column": 6,
            "name": "Patch 18 Cyan",
            "base_color": (0.07062, 0.21643, 0.35132),
        },
        {
            "row": 4,
            "column": 1,
            "name": "Patch 19 White 9.5 005D",
            "base_color": (0.87891, 0.88379, 0.84131),
        },
        {
            "row": 4,
            "column": 2,
            "name": "Patch 20 Neutral 8 023D",
            "base_color": (0.58691, 0.59131, 0.58545),
        },
        {
            "row": 4,
            "column": 3,
            "name": "Patch 21 Neutral 6.5 044D",
            "base_color": (0.36133, 0.36646, 0.36523),
        },
        {
            "row": 4,
            "column": 4,
            "name": "Patch 22 Neutral 5 070D",
            "base_color": (0.19031, 0.19080, 0.18994),
        },
        {
            "row": 4,
            "column": 5,
            "name": "Patch 23 Neutral 3.5 1.05D",
            "base_color": (0.08710, 0.08856, 0.08960),
        },
        {
            "row": 4,
            "column": 6,
            "name": "Patch 24 Black 2 1.5D",
            "base_color": (0.03146, 0.03149, 0.03220),
        },
    ]

    MACgroup = cmds.group(name = 'macbeth_spheres_grp', empty=True)
    patchGroupFlat = cmds.group(name = 'macbethPatchesFlat_grp', empty=True)
    MACflat = cmds.group(name = 'macbethFlat_grp', empty=True)
    MACctrlGrp = cmds.group(name = 'macbeth_ctrl_grp', empty=True)
    cmds.parent(MACctrlGrp, MACgroup)
    cmds.parent(MACflat, MACctrlGrp)
    cmds.parent(patchGroupFlat, MACflat)
    MACshaded = cmds.group(name = 'macbethShaded_grp', empty=True)
    patchGroupShaded = cmds.group(name = 'macbethPatchesShaded_grp', empty=True)
    cmds.parent(MACshaded, MACctrlGrp)
    cmds.parent(patchGroupShaded, MACshaded)
    Sphgroup = cmds.group(name = 'spheres_grp', empty=True)
    cmds.parent(Sphgroup, MACctrlGrp)
    mtp = 4.5

    #checker body flat
    chckBodyFlat = cmds.polyCube(name="checkerBodyFlat", width=28, height=19, depth=0.5,createUVs=4, ch=False)
    cmds.setAttr(chckBodyFlat[0] + ".translateZ",-0.25)
    cmds.setAttr(chckBodyFlat[0] + ".translateY",12)
    cmds.makeIdentity(chckBodyFlat[0], translate=True, apply=True)
    cmds.move(0,0,0, chckBodyFlat[0] + ".scalePivot", chckBodyFlat[0] + ".rotatePivot", absolute=True)
    cmds.parent(chckBodyFlat[0], MACflat)
    #checker body shader Flat
    chckShdFlat = cmds.shadingNode('aiFlat', asShader=True, name="aiMacbethBodyFlat")
    cmds.setAttr(chckShdFlat + ".color", 0,0,0, type='double3')
    cmds.select(chckBodyFlat[0])
    cmds.hyperShade(assign=chckShdFlat)

    #checker body shaded
    chckBodyShaded = cmds.polyCube(name="checkerBodyShaded", width=28, height=19, depth=0.5,createUVs=4, ch=False)
    cmds.setAttr(chckBodyShaded[0] + ".translateZ",-0.25)
    cmds.setAttr(chckBodyShaded[0] + ".translateY",32)
    cmds.makeIdentity(chckBodyShaded[0], translate=True, apply=True)
    cmds.move(0,0,0, chckBodyShaded[0] + ".scalePivot", chckBodyShaded[0] + ".rotatePivot", absolute=True)
    cmds.parent(chckBodyShaded[0], MACshaded)
    #checker body shader shaded
    chckShdShaded = cmds.shadingNode('aiStandardSurface', asShader=True, name="aiMacbethBodyShaded")
    cmds.setAttr(chckShdShaded + ".base", 1)
    cmds.setAttr(chckShdShaded + ".baseColor", 0,0,0, type='double3')
    cmds.setAttr(chckShdShaded + ".specular", 0.0)
    cmds.setAttr(chckShdShaded + ".specularRoughness", 0.5)
    cmds.select(chckBodyShaded[0])
    cmds.hyperShade(assign=chckShdShaded)

    #spheres
    #chrome
    chrome = cmds.polySphere(name="chromeSphere", radius=6.6,createUVs=2,ch=False)
    cmds.setAttr(chrome[0] + ".translateX",-7.5)
    cmds.setAttr(chrome[0] + ".translateY",49)
    cmds.setAttr(chrome[0] + '.aiSubdivType', 1)
    cmds.setAttr(chrome[0] + '.aiSubdivIterations', 3)
    cmds.makeIdentity(chrome[0], translate=True, apply=True)
    cmds.move(0,0,0, chrome[0] + ".scalePivot", chrome[0] + ".rotatePivot", absolute=True)
    cmds.parent(chrome[0], Sphgroup)
    chromeShd = cmds.shadingNode('aiStandardSurface', asShader=True, name="aiChrome")
    cmds.setAttr(chromeShd + ".base", 1)
    cmds.setAttr(chromeShd + ".baseColor", 0.75,0.75,0.75, type='double3')
    cmds.setAttr(chromeShd + ".metalness", 1)
    cmds.setAttr(chromeShd + ".specular", 1)
    cmds.setAttr(chromeShd + ".specularRoughness", 0)
    cmds.select(chrome[0])
    cmds.hyperShade(assign=chromeShd)
    #gray
    gray = cmds.polySphere(name="graySphere", radius=6.6,createUVs=2,ch=False)
    cmds.setAttr(gray[0] + ".translateX",7.5)
    cmds.setAttr(gray[0] + ".translateY",49)
    cmds.setAttr(gray[0] + '.aiSubdivType', 1)
    cmds.setAttr(gray[0] + '.aiSubdivIterations', 3)
    cmds.makeIdentity(gray[0], translate=True, apply=True)
    cmds.move(0,0,0, gray[0] + ".scalePivot", gray[0] + ".rotatePivot", absolute=True)
    cmds.parent(gray[0], Sphgroup)
    grayShd = cmds.shadingNode('aiStandardSurface', asShader=True, name="aiGray")
    cmds.setAttr(grayShd + ".base", 1)
    cmds.setAttr(grayShd + ".baseColor", 0.18,0.18,0.18, type='double3')
    cmds.setAttr(grayShd + ".specular", 0)
    cmds.setAttr(grayShd + ".specularRoughness", 0.7)
    cmds.select(gray[0])
    cmds.hyperShade(assign=grayShd)

    dispOver = [gray, chrome, chckBodyShaded, chckBodyFlat]
    for each in dispOver:
        doSel = cmds.ls(each)
        cmds.setAttr(each[0] + ".overrideEnabled", 1)
        cmds.setAttr(each[0] + ".overrideDisplayType", 2)

    #PATCHES FLAT
    for each in macbeth_data:
            #geo
            patch = cmds.polyCube(name=(each["name"] + "Flat"), width=4.2, height=4.2, depth=0.3, createUVs=4, axis=[0,1,0],ch=False)
            patchDOsel = cmds.ls(patch)
            cmds.setAttr(patch[0] + ".translateX", (each["column"])*mtp)
            cmds.setAttr(patch[0] + ".translateY", (each["row"])*-mtp)
            xpos = cmds.getAttr(patch[0] + ".translateX")
            ypos = cmds.getAttr(patch[0] + ".translateY")
            cmds.setAttr(patch[0] + ".translateX",xpos-15.75)
            cmds.setAttr(patch[0] + ".translateY",ypos+23.25)
            cmds.makeIdentity(patch[0], translate=True, apply=True)
            cmds.move(0,0,0, patch[0] + ".scalePivot", patch[0] + ".rotatePivot", absolute=True)
            cmds.setAttr(patch[0] + ".receiveShadows",0)
            cmds.setAttr(patch[0] + ".motionBlur",0)
            cmds.setAttr(patch[0] + ".castsShadows",0)
            cmds.setAttr(patch[0] + ".visibleInRefractions",0)
            cmds.setAttr(patch[0] + ".visibleInReflections",0)
            cmds.setAttr(patch[0] + ".aiVisibleInDiffuseReflection",0)
            cmds.setAttr(patch[0] + ".aiVisibleInSpecularReflection",0)
            cmds.setAttr(patch[0] + ".aiVisibleInDiffuseTransmission",0)
            cmds.setAttr(patch[0] + ".aiVisibleInSpecularTransmission",0)
            cmds.setAttr(patch[0] + ".aiVisibleInVolume",0)
            cmds.setAttr(patch[0] + ".aiSelfShadows",0)
            cmds.setAttr(patchDOsel[0] + ".overrideEnabled", 1)
            cmds.setAttr(patchDOsel[0] + ".overrideDisplayType", 2)
            cmds.setAttr(patch[0] + ".translateX", keyable=False, lock=True)
            cmds.setAttr(patch[0] + ".translateY", keyable=False, lock=True)
            cmds.setAttr(patch[0] + ".translateZ", keyable=False, lock=True)
            cmds.setAttr(patch[0] + ".rotateX", keyable=False, lock=True)
            cmds.setAttr(patch[0] + ".rotateY", keyable=False, lock=True)
            cmds.setAttr(patch[0] + ".rotateZ", keyable=False, lock=True)
            cmds.parent(patch[0], patchGroupFlat)
            #shader
            patchBscShd = cmds.shadingNode('aiFlat', asShader=True, name="ai" + (each["name"] + "Flat"))
            cmds.setAttr(patchBscShd + ".color", each["base_color"][0], each["base_color"][1], each["base_color"][2], type='double3')
            cmds.select(patch[0])
            cmds.hyperShade(assign=patchBscShd)

            #PATCHES SHADED
    for each in macbeth_data:
            #geo
            patchShaded = cmds.polyCube(name=(each["name"] + "Shaded"), width=4.2, height=4.2, depth=0.3, createUVs=4, axis=[0,1,0],ch=False)
            patchShadedDOsel = cmds.ls(patchShaded)
            cmds.setAttr(patchShaded[0] + ".translateX", (each["column"])*mtp)
            cmds.setAttr(patchShaded[0] + ".translateY", (each["row"])*-mtp)
            xpos = cmds.getAttr(patchShaded[0] + ".translateX")
            ypos = cmds.getAttr(patchShaded[0] + ".translateY")
            cmds.setAttr(patchShaded[0] + ".translateX",xpos-15.75)
            cmds.setAttr(patchShaded[0] + ".translateY",ypos+43.25)
            cmds.makeIdentity(patchShaded[0], translate=True, apply=True)
            cmds.move(0,0,0, patchShaded[0] + ".scalePivot", patchShaded[0] + ".rotatePivot", absolute=True)
            cmds.setAttr(patchShaded[0] + ".receiveShadows",0)
            cmds.setAttr(patchShaded[0] + ".motionBlur",0)
            cmds.setAttr(patchShaded[0] + ".castsShadows",0)
            cmds.setAttr(patchShaded[0] + ".visibleInRefractions",0)
            cmds.setAttr(patchShaded[0] + ".visibleInReflections",0)
            cmds.setAttr(patchShaded[0] + ".aiVisibleInDiffuseReflection",0)
            cmds.setAttr(patchShaded[0] + ".aiVisibleInSpecularReflection",0)
            cmds.setAttr(patchShaded[0] + ".aiVisibleInDiffuseTransmission",0)
            cmds.setAttr(patchShaded[0] + ".aiVisibleInSpecularTransmission",0)
            cmds.setAttr(patchShaded[0] + ".aiVisibleInVolume",0)
            cmds.setAttr(patchShaded[0] + ".aiSelfShadows",0)
            cmds.setAttr(patchShadedDOsel[0] + ".overrideEnabled", 1)
            cmds.setAttr(patchShadedDOsel[0] + ".overrideDisplayType", 2)
            cmds.setAttr(patchShaded[0] + ".translateX", keyable=False, lock=True)
            cmds.setAttr(patchShaded[0] + ".translateY", keyable=False, lock=True)
            cmds.setAttr(patchShaded[0] + ".translateZ", keyable=False, lock=True)
            cmds.setAttr(patchShaded[0] + ".rotateX", keyable=False, lock=True)
            cmds.setAttr(patchShaded[0] + ".rotateY", keyable=False, lock=True)
            cmds.setAttr(patchShaded[0] + ".rotateZ", keyable=False, lock=True)
            cmds.parent(patchShaded[0], patchGroupShaded)

            #shader
            patchBscShdShaded = cmds.shadingNode('aiStandardSurface', asShader=True, name="ai" + (each["name"] + "Shaded"))
            cmds.setAttr(patchBscShdShaded + ".base", 1)
            cmds.setAttr(patchBscShdShaded + ".baseColor", each["base_color"][0], each["base_color"][1], each["base_color"][2], type='double3')
            cmds.setAttr(patchBscShdShaded + ".specular", 0)
            cmds.setAttr(patchBscShdShaded + ".specularRoughness", 0.7)
            cmds.select(patchShaded[0])
            cmds.hyperShade(assign=patchBscShdShaded)

    #macbeth control curve and constraints
    macCtrl = cmds.curve(name="Macbeth_ctrl", degree=1, point=[(-17, -2, 0), (-17, 57, 0), (17, 57, 0), (17, -2, 0), (-17, -2, 0)] )
    macLoc = cmds.spaceLocator(name = "mac_loc", position = [0,0,0])

    cmds.parent(macCtrl, MACgroup)
    cmds.parent(macLoc, MACgroup)
    cmds.setAttr(macCtrl + ".translateY", 2)
    cmds.makeIdentity(macCtrl, translate=True, apply=True)
    cmds.move(0,0,0, macCtrl + ".scalePivot", macCtrl + ".rotatePivot", absolute=True)

    cmds.parentConstraint(macCtrl, MACctrlGrp, maintainOffset=True, weight=1)
    cmds.scaleConstraint(macCtrl, MACctrlGrp, maintainOffset=True, weight=1)
    cmds.setAttr(macCtrl + ".translateX", -170)

    #CREATE A MAC SCALING
    if cmds.namespace(exists=":dk_Ldv") == True:
        scale = cmds.getAttr("dk_Ldv:ldvGlobal_ctrl.scaleX")
        cmds.parentConstraint(macLoc[0], macCtrl, maintainOffset=True, weight=1)
        cmds.setAttr(macLoc[0] + ".scaleX", scale)
        cmds.setAttr(macCtrl + ".scaleX", scale)
        cmds.setAttr(macCtrl + ".scaleY", scale)
        cmds.setAttr(macCtrl + ".scaleZ", scale)

    #lock attr
    MACgrplist = [MACgroup, patchGroupFlat, MACflat, MACctrlGrp, MACshaded, patchGroupShaded, Sphgroup, chckBodyFlat[0], chckBodyShaded[0], chrome[0], gray[0] ]
    for each in MACgrplist:
        cmds.setAttr(each + ".translateX", keyable=False, lock=True)
        cmds.setAttr(each + ".translateY", keyable=False, lock=True)
        cmds.setAttr(each + ".translateZ", keyable=False, lock=True)
        cmds.setAttr(each + ".rotateX", keyable=False, lock=True)
        cmds.setAttr(each + ".rotateY", keyable=False, lock=True)
        cmds.setAttr(each + ".rotateZ", keyable=False, lock=True)

    #Arnold attributes
    attrList = [chckBodyFlat[0], chckBodyShaded[0], chrome[0], gray[0] ]
    for each in attrList:
        cmds.setAttr(each + ".receiveShadows",0)
        cmds.setAttr(each + ".motionBlur",0)
        cmds.setAttr(each + ".castsShadows",0)
        cmds.setAttr(each + ".visibleInRefractions",0)
        cmds.setAttr(each + ".visibleInReflections",0)
        cmds.setAttr(each + ".aiVisibleInDiffuseReflection",0)
        cmds.setAttr(each + ".aiVisibleInSpecularReflection",0)
        cmds.setAttr(each + ".aiVisibleInDiffuseTransmission",0)
        cmds.setAttr(each + ".aiVisibleInSpecularTransmission",0)
        cmds.setAttr(each + ".aiVisibleInVolume",0)
        cmds.setAttr(each + ".aiSelfShadows",0)

    cmds.namespace(set=':')
    cmds.select(clear=True)
     
def removeMAC(*args):
    cmds.namespace(set=':')
    if cmds.namespace(exists='mac') == False:
        cmds.warning('Nothing to remove')
    if cmds.namespace(exists='mac') == True:
        cmds.namespace(removeNamespace=':mac', deleteNamespaceContent=True)

def hdrSw(self, *_):
    hdr_num = cmds.intSliderGrp('hdrSw', query=True, value=True) 
    file = cmds.getFileList( folder=HDR_FOLDER, filespec='*.tx' )
    miniFile = cmds.getFileList( folder=MINI_HDR_FOLDER, filespec='*.jpg' )
    
    if cmds.namespace(exists='dk_Ldv') == True and len(file) != 0:
        new_hdr = os.path.join(HDR_FOLDER, file[hdr_num-1]).replace("\\", "/")
        minIntFile = os.path.join(MINI_HDR_FOLDER, miniFile[hdr_num-1]).replace("\\", "/")
        cmds.image("hdrSym", edit=True, image=minIntFile)
        cmds.setAttr("dk_Ldv:hdrTextures" + '.filename', str(new_hdr), type = "string")
        cmds.setAttr('dk_Ldv:aiSkydomeShape.hdrsl', hdr_num)
    if len(file) != 0:
        minIntFile = os.path.join(MINI_HDR_FOLDER, miniFile[hdr_num-1]).replace("\\", "/")
        cmds.image("hdrSym", edit=True, image=minIntFile)

    else:
        cmds.warning("Refresh HDRs")

def exposure_slider(self, *_):
    if cmds.namespace(exists='dk_Ldv') == True:
        cmds.undoInfo( swf=False )
        value=cmds.floatSliderGrp('exp', query=True, value=True)
        cmds.setAttr('dk_Ldv:aiSkydomeShape.exposure', value)
        cmds.undoInfo( swf=True)

def rotOffset(self, *_):
    if cmds.namespace(exists='dk_Ldv') == True:
        skyRot = cmds.getAttr("dk_Ldv:aiSkydome.rotateY")
        cmds.undoInfo( swf=False )
        value=cmds.floatSliderGrp("rotOff", query=True, value=True)
        skyAddedRot = skyRot + value
        cmds.setAttr('dk_Ldv:aiSkydome.rotateY', skyAddedRot)
        cmds.setAttr("dk_Ldv:aiSkydomeShape.rotOffset", value)
        cmds.undoInfo( swf=True)

def objOffset(self, *_):
    if cmds.namespace(exists='dk_turn') == True:
        objRot = cmds.getAttr("dk_turn:obj_tt_loc.rotateY")
        cmds.undoInfo( swf=False )
        value=cmds.floatSliderGrp("objOff", query=True, value=True)
        objAddedRot = objRot + value
        cmds.setAttr("dk_turn:obj_tt_Offloc.rotateY", objAddedRot)
        cmds.setAttr("dk_turn:obj_tt_Offloc.objOffset", value)
        cmds.undoInfo( swf=True)

def sky_vis(self, *_):
    if cmds.namespace(exists='dk_Ldv') == True:
        cmds.undoInfo( swf=False )
        value=cmds.floatSliderGrp('sky_vis', query=True, value=True)
        cmds.setAttr('dk_Ldv:aiSkydomeShape.camera', value)
        cmds.undoInfo( swf=True)

def refHDR(*args):
    #hdrexr = cmds.getFileList( folder=HDR_FOLDER, filespec='*.exr')
    hdrhdr = cmds.getFileList( folder=HDR_FOLDER, filespec='*.hdr')
    hdrtx = cmds.getFileList( folder=HDR_FOLDER, filespec='*.tx')
    minijpg = cmds.getFileList( folder=MINI_HDR_FOLDER, filespec='*.jpg')
    minijpeg = cmds.getFileList( folder=MINI_HDR_FOLDER, filespec='*.jpeg')
    hdrList = hdrhdr
    miniList = minijpg + minijpeg
    prog = 0
    
    dialog = cmds.confirmDialog(title = "Lookdev Kit 2.0 - Rebuild", message = "This will delete all files in miniHDRs folder and refresh HDR files", button=["Yes", "No"], cancelButton="No", dismissString = "No")
    if len(miniList) == 0 and len(hdrList) == 0:
        cmds.warning("HDR folder is empty")
        return

    if dialog == "Yes":
        cmds.warning("Rebuilding HDRs")
        cmds.arnoldFlushCache(textures=True)
        cmds.pause(seconds=2)
        if cmds.namespace(exists='dk_Ldv') == True:
            cmds.namespace(removeNamespace=':dk_Ldv', deleteNamespaceContent=True)
        cmds.namespace(add='dk_bake')
        cmds.namespace(set=':dk_bake')

        #delete mini hdrs
        for each in miniList:
                delPath = os.path.join(MINI_HDR_FOLDER, each).replace("\\", "/")
                cmds.sysFile(delPath, delete=True)
        for each in hdrtx:
                deltx = os.path.join(HDR_FOLDER, each).replace("\\", "/")
                cmds.sysFile(deltx, delete=True)
        cmds.progressWindow(title='Baking HDR preview images', progress=prog, status='Baking: 0%' )
        #create planes:
        for each in hdrList:
            hdrPath = os.path.join(HDR_FOLDER, each).replace("\\", "/")
            miniPath = os.path.join(MINI_HDR_FOLDER, each).replace("\\", "/")
            lowPlane = cmds.polyPlane(name= each + "_low", axis=[0,1,0], width=2, height=1, subdivisionsX = 1, subdivisionsY = 1, cuv=1, ch=0 )
            highPlane = cmds.polyPlane(name= each + "_high", axis=[0,1,0], width=2, height=1, subdivisionsX = 1, subdivisionsY = 1, cuv=1, ch=0 )
            numhdr = len(hdrList)
            maxNumBake = 100/int(numhdr)

            for each in highPlane:
                lambHi = cmds.shadingNode('lambert', asShader=True, name = each + "_high")
                cmds.select(each)
                cmds.hyperShade(assign=lambHi)
                imageNode = cmds.shadingNode("file",asTexture=True, name = each + "_high")
                cmds.connectAttr(imageNode + '.outColor', lambHi + '.color', force=True)
                cmds.setAttr(imageNode + '.fileTextureName', hdrPath, type = "string")
                cmds.setAttr(imageNode + '.colorSpace', 'Raw', type='string')
                cmds.setAttr(imageNode + '.ignoreColorSpaceFileRules',1)
            for each in lowPlane:
                lambLo = cmds.shadingNode('lambert', asShader=True, name = each + "_low")
                cmds.select(each)
                cmds.hyperShade(assign=lambLo)

            cmds.surfaceSampler(target = lowPlane, source = highPlane, searchCage="", searchOffset=0, uvSet="map1", mapOutput="diffuseRGB", mapWidth=300, mapHeight=150, maximumValue=2, mapSpace="tangent", mapMaterials=1, shadows=0, filename=miniPath, fileFormat="jpg", superSampling=2, filterSize=3, filterType=0, overscan=1, flipV=False, flipU=False  )
            prog += maxNumBake
            cmds.progressWindow(edit=True, progress=prog, status='Baking HDR preview images: ' )
            cmds.pause( seconds=1 )
            if cmds.progressWindow(query=True, progress=True) == 100:
                prog = 0
                cmds.progressWindow(endProgress=1)
                break

        cmds.namespace(removeNamespace=':dk_bake',deleteNamespaceContent=True)
        cmds.namespace(set=':')
        
        cmds.progressWindow(title='Converting textures to TX', progress=prog, status='Converting: 0%' )
        for each in hdrList:
            hdrPath = os.path.join(HDR_FOLDER, each).replace("\\", "/")
            mtoa_plugin = cmds.pluginInfo("mtoa", query=True, path=True) 
            mtoa_root = os.path.dirname(os.path.dirname(mtoa_plugin)) 
            mtoa_maketx = os.path.join(mtoa_root, "bin", "maketx").replace("\\", "/") 
            base, ext = os.path.splitext(each)
            outfile = base + ".tx"
            out = os.path.join(HDR_FOLDER, outfile).replace("\\", "/")
            baketx = subprocess.Popen([mtoa_maketx, "-v",  "-u",  "--oiio", "--stats", "--monochrome-detect", "--constant-color-detect", "--opaque-detect", "--filter", "lanczos3", hdrPath, "-o", out], shell=True)
            prog += maxNumBake
            cmds.progressWindow(edit=True, progress=prog, status='Converting textures to TX: ' )
            baketx.wait()
            if cmds.progressWindow(query=True, progress=True) == 100:
                cmds.pause( seconds=5 )
                prog = 0
                cmds.progressWindow(endProgress=1)
                break
        cmds.pause( seconds=3 )
        buildUI()
    else:
        cmds.warning("Operation Canceled")

def deletePrevTx(*args):
    hdrtx = cmds.getFileList( folder=HDR_FOLDER, filespec='*.tx')
    minijpg = cmds.getFileList( folder=MINI_HDR_FOLDER, filespec='*.jpg')
    minijpeg = cmds.getFileList( folder=MINI_HDR_FOLDER, filespec='*.jpeg')
    miniList = minijpg + minijpeg
    cmds.arnoldFlushCache(textures=True)
    cmds.pause(seconds=2)
    for each in miniList:
                delPath = os.path.join(MINI_HDR_FOLDER, each).replace("\\", "/")
                cmds.sysFile(delPath, delete=True)
    for each in hdrtx:
            deltx = os.path.join(HDR_FOLDER, each).replace("\\", "/")
            cmds.sysFile(deltx, delete=True)
    buildUI()

def hdrFol(*args):
    dir = os.path.join(LOOKDEV_KIT_FOLDER, "sourceimages", "hdr")
    os.popen('start explorer "%s" ' % dir)

def turntableButton(*args):
    ldvTitle = "Lookdev Kit 2.0"
    initSel= cmds.ls(selection=True, transforms=True)
    ldvSel = cmds.ls("dk_Ldv:*",transforms=True)
    macSel = cmds.ls("mac:*",transforms=True)
    camSel = cmds.ls(exactType="camera")
    assetSel = set(initSel) - set(ldvSel) - set(macSel) - set(camSel)
    if len(assetSel) == 0:
        cmds.confirmDialog(title=ldvTitle, message="Please first select your asset. It would be best that all asset elements are in the single group." ,messageAlign="center",button="Ok",defaultButton="Ok",icon="warning")
    else:
        if cmds.namespace(exists='dk_turn') == True:
            cmds.namespace(removeNamespace=':dk_turn', deleteNamespaceContent=True)
        if cmds.namespace(exists='dk_Ldv') == True:
            setTurntable(assetSel)
            cmds.parent("dk_turn:turntable_grp", "dk_Ldv:lookdevkit_grp")
        if cmds.namespace(exists='dk_Ldv') == False:
            createLDV()
            setTurntable(assetSel)
            cmds.parent("dk_turn:turntable_grp", "dk_Ldv:lookdevkit_grp")
    cmds.select(clear=True)
    cmds.select(assetSel)

def removeTurntable(*args):
    cmds.namespace(set=':')
    if cmds.namespace(exists=':dk_turn') == False:
        cmds.warning('Nothing to remove')
    if cmds.namespace(exists=':dk_turn') == True:
        cmds.namespace(removeNamespace=':dk_turn', deleteNamespaceContent=True)

def setTurntable(objects):
    timeMin = cmds.playbackOptions(minTime=True, query=True)
    timeMax = cmds.playbackOptions(maxTime=True, query=True)
    FrNum = cmds.optionMenu('autott', select=True, query=True)
    if FrNum == 1:
        FrRange = 25
    if FrNum == 2:
        FrRange = 50
    if FrNum == 3:
        FrRange = 100
    if FrNum == 4:
        FrRange = 200
    numFr = timeMax - timeMin
    addFr = FrRange - numFr
    subFr = numFr - FrRange
    if numFr < FrRange:
        cmds.playbackOptions(maxTime=timeMax + addFr)
        cmds.playbackOptions(animationEndTime=timeMax + addFr)
        
    if numFr > FrRange:
        cmds.playbackOptions(maxTime=timeMax - subFr)
        cmds.playbackOptions(animationEndTime=timeMax - subFr)

    cmds.currentTime(timeMin)

    #create locators
    cmds.namespace(add='dk_turn')
    cmds.namespace(set='dk_turn:')
    turnGrp = cmds.group(name = 'turntable_grp', empty=True)
    objLoc = cmds.spaceLocator(name = "obj_tt_loc", position = [0,0,0])
    objOffLoc = cmds.spaceLocator(name = "obj_tt_Offloc", position = [0,0,0])
    skyLoc = cmds.spaceLocator(name = "sky_tt_loc", position = [0,0,0])
    cmds.addAttr(objOffLoc[0], longName="objOffset", min=0, max=360,defaultValue=0, attributeType="double"  )
    cmds.parent(objOffLoc, turnGrp)
    cmds.parent(objLoc, turnGrp)
    cmds.parent(skyLoc, turnGrp)
    print("P wins!")
    cmds.setAttr(objLoc[0] + ".visibility",0)
    cmds.setAttr(objOffLoc[0] + ".visibility",0)
    cmds.setAttr(skyLoc[0] + ".visibility",0)
    #animate locators
    objRotMin = cmds.playbackOptions(minTime=True, query=True)
    objRotMax = timeMin + FrRange / 2
    skyRotMin = timeMin + FrRange / 2
    skyRotMax = cmds.playbackOptions(maxTime=True, query=True)
    cmds.setKeyframe( objLoc[0], attribute='rotateY', inTangentType = "linear", outTangentType = "linear", time=objRotMin, value= 0 )
    cmds.setKeyframe( objLoc[0], attribute='rotateY', inTangentType = "linear", outTangentType = "linear", time=objRotMax, value= 360 )
    cmds.setKeyframe( skyLoc[0], attribute='rotateY', inTangentType = "linear", outTangentType = "linear", time=skyRotMin, value= 0 )
    cmds.setKeyframe( skyLoc[0], attribute='rotateY', inTangentType = "linear", outTangentType = "linear", time=skyRotMax, value= 360 )
    cmds.parentConstraint(skyLoc, "dk_Ldv:aiSkydome", maintainOffset=True, weight=1)
    cmds.parentConstraint(objLoc, objOffLoc, maintainOffset=True, weight=1)
    
    for each in objects:
        cmds.orientConstraint(objOffLoc, each, maintainOffset=True, weight=1)

    cmds.namespace(set=':')

def subd_off(*args):
    sel = cmds.ls(sl=True)
    shapeSel = cmds.listRelatives(sel, s=True)
    for each in shapeSel:
        cmds.setAttr(each + '.aiSubdivType', 0)

def catclark_on(*args):
    value = cmds.intSliderGrp('subIter', query=True, value=True)
    sel = cmds.ls(sl=True)
    shapeSel = cmds.listRelatives(sel, shapes=True)
    for each in shapeSel:
        cmds.setAttr(each + '.aiSubdivType', 1)
        cmds.setAttr(each + '.aiSubdivIterations', value)

def subd_iter(self, *_):
    if cmds.namespace(exists='dk_Ldv') == True:
        cmds.undoInfo( swf=False )
        sel = cmds.ls(sl=True)
        shapeSel = cmds.listRelatives(sel, s=True)
        value=cmds.intSliderGrp('subIter', query=True, value=True)
        for each in shapeSel:
            cmds.setAttr(each + '.aiSubdivIterations', value)
            cmds.undoInfo( swf=True)

def bucket_size16(*args):
    cmds.setAttr("defaultArnoldRenderOptions.bucketSize", 16)

def bucket_size32(*args):
    cmds.setAttr("defaultArnoldRenderOptions.bucketSize", 32)

def bucket_size64(*args):
    cmds.setAttr("defaultArnoldRenderOptions.bucketSize", 64)

def bucket_size128(*args):
    cmds.setAttr("defaultArnoldRenderOptions.bucketSize", 128)

def checker(*args):
    if cmds.namespace(exists='dk_chck:') == True:
        cmds.warning('Checker shader is already loaded')
    else:
        cmds.namespace(add='dk_chck')
        cmds.namespace(set='dk_chck:')
        chckBase = cmds.shadingNode('aiStandardSurface', asShader=True)
        chckShader = cmds.rename(chckBase, 'aiCheckerShader')
        chckImage = core.createArnoldNode('aiImage', name = 'checkerTexture')
        checker_tex = (TEX_FOLDER + '/' + 'checker.jpg' )
        cmds.setAttr(chckImage + '.filename', checker_tex, type = "string")
        cmds.setAttr(chckImage + '.colorSpace', 'sRGB', type='string')
        cmds.setAttr(chckImage + '.autoTx',0)
        cmds.setAttr(chckImage + '.ignoreColorSpaceFileRules',1)
        cmds.connectAttr(chckImage + '.outColor', chckShader + '.baseColor', force=True)
        cmds.namespace(set=':')
        cmds.select(clear=True)

def remove_checker(*args):
    cmds.namespace(set=':')
    if cmds.namespace(exists=':dk_chck') == False:
        cmds.warning('Nothing to remove')
    if cmds.namespace(exists=':dk_chck') == True:
        cmds.namespace(removeNamespace=':dk_chck', deleteNamespaceContent=True)

def color_mcc10(*args):
    sel = cmds.ls(sl=True)
    shapeSel = cmds.listRelatives(sel, s=True)
    for each in shapeSel:
        if cmds.attributeQuery('mtoa_constant_color' ,node=each, exists=True) == True:
            cmds.deleteAttr( each, attribute='mtoa_constant_color' )

        if cmds.attributeQuery('mtoa_constant_color2' ,node=each, exists=True) == True:
            cmds.deleteAttr( each, attribute='mtoa_constant_color2' )

        cmds.addAttr(each, ln='mtoa_constant_color', at='double3')
        cmds.addAttr(each, ln='mtoa_constant_colorX', at='double', p='mtoa_constant_color')
        cmds.addAttr(each, ln='mtoa_constant_colorY', at='double', p='mtoa_constant_color')
        cmds.addAttr(each, ln='mtoa_constant_colorZ', at='double', p='mtoa_constant_color')
        cmds.setAttr(each + '.mtoa_constant_color', 0, 0, 0, typ='double3')
        cmds.setAttr(each + '.mtoa_constant_color', k=True)
        cmds.setAttr(each + '.mtoa_constant_colorX', k=True)
        cmds.setAttr(each + '.mtoa_constant_colorY', k=True)
        cmds.setAttr(each + '.mtoa_constant_colorZ', k=True)

def color_mcc1r(*args):
    sel = cmds.ls(sl=True)
    shapeSel = cmds.listRelatives(sel, s=True)
    for each in shapeSel:
        if cmds.attributeQuery('mtoa_constant_color' ,node=each, exists=True) == True:
            cmds.deleteAttr( each, attribute='mtoa_constant_color' )

        if cmds.attributeQuery('mtoa_constant_color2' ,node=each, exists=True) == True:
            cmds.deleteAttr( each, attribute='mtoa_constant_color2' )

        cmds.addAttr(each, ln='mtoa_constant_color', at='double3')
        cmds.addAttr(each, ln='mtoa_constant_colorX', at='double', p='mtoa_constant_color')
        cmds.addAttr(each, ln='mtoa_constant_colorY', at='double', p='mtoa_constant_color')
        cmds.addAttr(each, ln='mtoa_constant_colorZ', at='double', p='mtoa_constant_color')
        cmds.setAttr(each + '.mtoa_constant_color', 1, 0, 0, typ='double3')
        cmds.setAttr(each + '.mtoa_constant_color', k=True)
        cmds.setAttr(each + '.mtoa_constant_colorX', k=True)
        cmds.setAttr(each + '.mtoa_constant_colorY', k=True)
        cmds.setAttr(each + '.mtoa_constant_colorZ', k=True)

def color_mcc1g(*args):
    sel = cmds.ls(sl=True)
    shapeSel = cmds.listRelatives(sel, s=True)
    for each in shapeSel:
        if cmds.attributeQuery('mtoa_constant_color' ,node=each, exists=True) == True:
            cmds.deleteAttr( each, attribute='mtoa_constant_color' )

        if cmds.attributeQuery('mtoa_constant_color2' ,node=each, exists=True) == True:
            cmds.deleteAttr( each, attribute='mtoa_constant_color2' )

        cmds.addAttr(each, ln='mtoa_constant_color', at='double3')
        cmds.addAttr(each, ln='mtoa_constant_colorX', at='double', p='mtoa_constant_color')
        cmds.addAttr(each, ln='mtoa_constant_colorY', at='double', p='mtoa_constant_color')
        cmds.addAttr(each, ln='mtoa_constant_colorZ', at='double', p='mtoa_constant_color')
        cmds.setAttr(each + '.mtoa_constant_color', 0, 1, 0, typ='double3')
        cmds.setAttr(each + '.mtoa_constant_color', k=True)
        cmds.setAttr(each + '.mtoa_constant_colorX', k=True)
        cmds.setAttr(each + '.mtoa_constant_colorY', k=True)
        cmds.setAttr(each + '.mtoa_constant_colorZ', k=True)

def color_mcc1b(*args):
    sel = cmds.ls(sl=True)
    shapeSel = cmds.listRelatives(sel, s=True)
    for each in shapeSel:
        if cmds.attributeQuery('mtoa_constant_color' ,node=each, exists=True) == True:
            cmds.deleteAttr( each, attribute='mtoa_constant_color' )

        if cmds.attributeQuery('mtoa_constant_color2' ,node=each, exists=True) == True:
            cmds.deleteAttr( each, attribute='mtoa_constant_color2' )

        cmds.addAttr(each, ln='mtoa_constant_color', at='double3')
        cmds.addAttr(each, ln='mtoa_constant_colorX', at='double', p='mtoa_constant_color')
        cmds.addAttr(each, ln='mtoa_constant_colorY', at='double', p='mtoa_constant_color')
        cmds.addAttr(each, ln='mtoa_constant_colorZ', at='double', p='mtoa_constant_color')
        cmds.setAttr(each + '.mtoa_constant_color', 0, 0, 1, typ='double3')
        cmds.setAttr(each + '.mtoa_constant_color', k=True)
        cmds.setAttr(each + '.mtoa_constant_colorX', k=True)
        cmds.setAttr(each + '.mtoa_constant_colorY', k=True)
        cmds.setAttr(each + '.mtoa_constant_colorZ', k=True)

#MCC COLOR2

def color_mcc20(*args):
    sel = cmds.ls(sl=True)
    shapeSel = cmds.listRelatives(sel, s=True)
    for each in shapeSel:
        if cmds.attributeQuery('mtoa_constant_color' ,node=each, exists=True) == True:
            cmds.deleteAttr( each, attribute='mtoa_constant_color' )

        if cmds.attributeQuery('mtoa_constant_color2' ,node=each, exists=True) == True:
            cmds.deleteAttr( each, attribute='mtoa_constant_color2' )

        cmds.addAttr(each, ln='mtoa_constant_color2', at='double3')
        cmds.addAttr(each, ln='mtoa_constant_color2X', at='double', p='mtoa_constant_color2')
        cmds.addAttr(each, ln='mtoa_constant_color2Y', at='double', p='mtoa_constant_color2')
        cmds.addAttr(each, ln='mtoa_constant_color2Z', at='double', p='mtoa_constant_color2')
        cmds.setAttr(each + '.mtoa_constant_color2', 0, 0, 0, typ='double3')
        cmds.setAttr(each + '.mtoa_constant_color2', k=True)
        cmds.setAttr(each + '.mtoa_constant_color2X', k=True)
        cmds.setAttr(each + '.mtoa_constant_color2Y', k=True)
        cmds.setAttr(each + '.mtoa_constant_color2Z', k=True)

def color_mcc2r(*args):
    sel = cmds.ls(sl=True)
    shapeSel = cmds.listRelatives(sel, s=True)
    for each in shapeSel:
        if cmds.attributeQuery('mtoa_constant_color' ,node=each, exists=True) == True:
            cmds.deleteAttr( each, attribute='mtoa_constant_color' )

        if cmds.attributeQuery('mtoa_constant_color2' ,node=each, exists=True) == True:
            cmds.deleteAttr( each, attribute='mtoa_constant_color2' )

        cmds.addAttr(each, ln='mtoa_constant_color2', at='double3')
        cmds.addAttr(each, ln='mtoa_constant_color2X', at='double', p='mtoa_constant_color2')
        cmds.addAttr(each, ln='mtoa_constant_color2Y', at='double', p='mtoa_constant_color2')
        cmds.addAttr(each, ln='mtoa_constant_color2Z', at='double', p='mtoa_constant_color2')
        cmds.setAttr(each + '.mtoa_constant_color2', 1, 0, 0, typ='double3')
        cmds.setAttr(each + '.mtoa_constant_color2', k=True)
        cmds.setAttr(each + '.mtoa_constant_color2X', k=True)
        cmds.setAttr(each + '.mtoa_constant_color2Y', k=True)
        cmds.setAttr(each + '.mtoa_constant_color2Z', k=True)

def color_mcc2g(*args):
    sel = cmds.ls(sl=True)
    shapeSel = cmds.listRelatives(sel, s=True)
    for each in shapeSel:
        if cmds.attributeQuery('mtoa_constant_color' ,node=each, exists=True) == True:
            cmds.deleteAttr( each, attribute='mtoa_constant_color' )

        if cmds.attributeQuery('mtoa_constant_color2' ,node=each, exists=True) == True:
            cmds.deleteAttr( each, attribute='mtoa_constant_color2' )

        cmds.addAttr(each, ln='mtoa_constant_color2', at='double3')
        cmds.addAttr(each, ln='mtoa_constant_color2X', at='double', p='mtoa_constant_color2')
        cmds.addAttr(each, ln='mtoa_constant_color2Y', at='double', p='mtoa_constant_color2')
        cmds.addAttr(each, ln='mtoa_constant_color2Z', at='double', p='mtoa_constant_color2')
        cmds.setAttr(each + '.mtoa_constant_color2', 0, 1, 0, typ='double3')
        cmds.setAttr(each + '.mtoa_constant_color2', k=True)
        cmds.setAttr(each + '.mtoa_constant_color2X', k=True)
        cmds.setAttr(each + '.mtoa_constant_color2Y', k=True)
        cmds.setAttr(each + '.mtoa_constant_color2Z', k=True)

def color_mcc2b(*args):
    sel = cmds.ls(sl=True)
    shapeSel = cmds.listRelatives(sel, s=True)
    for each in shapeSel:
        if cmds.attributeQuery('mtoa_constant_color' ,node=each, exists=True) == True:
            cmds.deleteAttr( each, attribute='mtoa_constant_color' )

        if cmds.attributeQuery('mtoa_constant_color2' ,node=each, exists=True) == True:
            cmds.deleteAttr( each, attribute='mtoa_constant_color2' )

        cmds.addAttr(each, ln='mtoa_constant_color2', at='double3')
        cmds.addAttr(each, ln='mtoa_constant_color2X', at='double', p='mtoa_constant_color2')
        cmds.addAttr(each, ln='mtoa_constant_color2Y', at='double', p='mtoa_constant_color2')
        cmds.addAttr(each, ln='mtoa_constant_color2Z', at='double', p='mtoa_constant_color2')
        cmds.setAttr(each + '.mtoa_constant_color2', 0, 0, 1, typ='double3')
        cmds.setAttr(each + '.mtoa_constant_color2', k=True)
        cmds.setAttr(each + '.mtoa_constant_color2X', k=True)
        cmds.setAttr(each + '.mtoa_constant_color2Y', k=True)
        cmds.setAttr(each + '.mtoa_constant_color2Z', k=True)

#UI
def buildUI():
    if cmds.namespace(exists='dk_Ldv') == True:
        skyExpo = cmds.getAttr('dk_Ldv:aiSkydome.exposure')
    else:
        skyExpo = 0

    if cmds.namespace(exists='dk_Ldv') == True:
        skyVis = cmds.getAttr('dk_Ldv:aiSkydome.camera')
    else:
        skyVis = 1

    if cmds.namespace(exists='dk_Ldv') == True:
        skyRotOffset = cmds.getAttr('dk_Ldv:aiSkydomeShape.rotOffset')
        skyOff = skyRotOffset
    else:
        skyOff = 0

    miniFile = cmds.getFileList( folder=MINI_HDR_FOLDER, filespec='*.jpg' ) 
    hdrtx = cmds.getFileList( folder=HDR_FOLDER, filespec='*.tx')

    if cmds.namespace(exists='dk_Ldv') == True and len(hdrtx) != 0:
        hdrswitch = cmds.getAttr('dk_Ldv:aiSkydomeShape.hdrsl')
        hdrslide = hdrswitch
        hdrCount = len(hdrtx)
    if len(hdrtx) != 0:
        hdrslide = 1
        hdrCount = len(hdrtx)
    else:
        hdrslide = 1
        hdrCount = 1

    if cmds.namespace(exists='dk_Ldv') == True and len(miniFile) != 0:
        hdrswitch = cmds.getAttr('dk_Ldv:aiSkydomeShape.hdrsl')-1
        minIntFile = os.path.join(MINI_HDR_FOLDER, miniFile[hdrswitch]).replace("\\", "/")
        #txIntFile = os.path.join(HDR_FOLDER, hdrtx[hdrswitch]).replace("\\", "/")
    if len(miniFile) != 0:
        miniFile = cmds.getFileList( folder=MINI_HDR_FOLDER, filespec='*.jpg' )
        minIntFile = os.path.join(MINI_HDR_FOLDER, miniFile[0]).replace("\\", "/")
        txIntFile = os.path.join(HDR_FOLDER, hdrtx[0]).replace("\\", "/")
    else:
        miniFile = cmds.getFileList( folder=MINI_HDR_FOLDER, filespec='*.jpg' )
        minIntFile = os.path.join(TEX_FOLDER, "no_prev.jpg").replace("\\", "/")
        #txIntFile = os.path.join(HDR_FOLDER, "no_prev.tx").replace("\\", "/")

    if cmds.namespace(exists='dk_turn') == True:
        objRotOffset = cmds.getAttr('dk_turn:obj_tt_Offloc.rotateY')
        objOff = objRotOffset
    else:
        objOff = 0

    winID = 'LdvUI'
    winWidth = 350
    winHeight = 712
    rowHeight = 30
    ldvTitle = "Lookdev Kit 2.0"

    if cmds.window(winID, exists=True):
        cmds.deleteUI(winID)

    w = cmds.window(winID, title=ldvTitle, width=winWidth, height=winHeight, sizeable=False)

    #Main layout refs
    mainCL = cmds.columnLayout()

    #Buttons - LDV kit
    tmpRowWidth = [winWidth*0.5, winWidth*0.5]

    cmds.rowLayout(numberOfColumns=2, columnWidth2=tmpRowWidth, height=rowHeight)
    cmds.button(label='Load LDV Kit', width=tmpRowWidth[0], annotation="Load Lookdev Kit", command=LDVbutton)
    cmds.button(label='Remove LDV Kit', width=tmpRowWidth[1], annotation="Remove Lookdev Kit", command=removeLDV)

    cmds.setParent(mainCL)

    #Buttons - MacBeth and spheres
    tmpRowWidth = [winWidth*0.5, winWidth*0.5]
    cmds.rowLayout(numberOfColumns=2, columnWidth2=tmpRowWidth)
    cmds.button(label='Load MAC', width=tmpRowWidth[0], annotation="Load Macbeth Chart, chrome and gray spheres", command=Macbutton)
    cmds.button(label='Remove MAC', width=tmpRowWidth[0], annotation="Remove Macbeth chart and spheres", command=removeMAC)
    cmds.setParent(mainCL)

    cmds.text(label='--- Skydome Controls ---', width=winWidth, height=rowHeight)

    #hdr switch
    tmpRowWidth = [winWidth*0.2, winWidth*0.2, winWidth*0.5]

    cmds.rowLayout(numberOfColumns=1, adjustableColumn=True)
    cmds.intSliderGrp('hdrSw', label='HDR', columnWidth3=(tmpRowWidth), min=1, max=hdrCount, value=hdrslide, step=1, fieldMinValue=0,fieldMaxValue=10, field=True, changeCommand=hdrSw, dragCommand=hdrSw)
    cmds.setParent(mainCL)

    #image
    tmpRowWidth = [winWidth*1, winWidth*0.065]
    cmds.rowLayout(numberOfColumns=1, columnOffset1 =tmpRowWidth[1], columnAttach1="both")
    cmds.image("hdrSym", image=minIntFile, width=tmpRowWidth[0])
    cmds.setParent(mainCL)

    #Skydome Exposure
    tmpRowWidth = [winWidth*0.3, winWidth*0.15, winWidth*0.45]
    cmds.rowLayout(numberOfColumns=1, adjustableColumn=True)
    cmds.floatSliderGrp('exp',label='Exposure', columnWidth3=(tmpRowWidth), min=-10, max=10, value=skyExpo, step=0.001, fieldMinValue=-100,fieldMaxValue=100, field=True, changeCommand=exposure_slider, dragCommand=exposure_slider)
    cmds.setParent(mainCL)

    #Skydome Rotation offset
    cmds.rowLayout(numberOfColumns=1, adjustableColumn=True)
    cmds.floatSliderGrp('rotOff',label='Rot. Offset', columnWidth3=(tmpRowWidth), min=0, max=360, value=skyOff, step=0.001, fieldMinValue=0,fieldMaxValue=360, field=True, changeCommand=rotOffset, dragCommand=rotOffset)
    cmds.setParent(mainCL)

    #Skydome camera visibility
    cmds.rowLayout(numberOfColumns=1, adjustableColumn=True)
    cmds.floatSliderGrp('sky_vis', label='Camera', min=0, max=1, value=skyVis, step=0.001, field=True, columnWidth3=(tmpRowWidth), changeCommand=sky_vis, dragCommand=sky_vis)
    cmds.setParent(mainCL)

    #refresh HDRS
    tmpRowWidth = [winWidth*0.5, winWidth*0.5]
    cmds.rowLayout(numberOfColumns=2, columnWidth2=tmpRowWidth)
    cmds.button(label='Refresh HDRs', width=tmpRowWidth[0], annotation="Recreate .jpg preview images and .tx files from existing HDRs", command=refHDR)
    cmds.button(label='Open HDR folder', width=tmpRowWidth[1], annotation="Open folder with HDR files", command=hdrFol)
    cmds.setParent(mainCL)

    tmpRowWidth = [winWidth*0.5, winWidth*0.5]
    cmds.rowLayout(numberOfColumns=2, columnWidth2=tmpRowWidth)
    cmds.button(label='Del Tx/jpg', width=tmpRowWidth[1], annotation="Delete .jpg preview images and .tx files", command=deletePrevTx)
    cmds.setParent(mainCL)

    #Auto Turntable

    cmds.text(label='--- Setup Turntable ---', width=winWidth, height=rowHeight)
    tmpRowWidth = [winWidth*0.3, winWidth*0.35, winWidth*0.35]
    cmds.rowLayout(numberOfColumns=3)
    cmds.optionMenu('autott', label='Length', width=tmpRowWidth[0])
    cmds.menuItem(label='25')
    cmds.menuItem(label='50')
    cmds.menuItem(label='100')
    cmds.menuItem(label='200')
    cmds.button(label='Setup Turntable', width=tmpRowWidth[1], annotation="Create a turntable setup based on the selected objects and chosen number of frames. NOTE: Turntable won't be applied on the LDV kit objects.", command=turntableButton)
    cmds.button(label='Remove Turntable', width=tmpRowWidth[2],annotation="Remove turntable setup", command=removeTurntable)
    cmds.setParent(mainCL)

    #Object Rotation offset
    tmpRowWidth = [winWidth*0.3, winWidth*0.15, winWidth*0.45]
    cmds.rowLayout(numberOfColumns=1, adjustableColumn=True)
    cmds.floatSliderGrp('objOff',label='Obj. Rot. Offset', columnWidth3=(tmpRowWidth), min=0, max=360, value=objOff, step=0.001, fieldMinValue=0,fieldMaxValue=360, field=True, changeCommand=objOffset, dragCommand=objOffset)
    cmds.setParent(mainCL)

    #SUBD CONTROLS

    cmds.text(label='--- SubD Settings ---', width=winWidth, height=rowHeight)

    tmpRowWidth = [winWidth*0.25, winWidth*0.25, winWidth*0.48]
    cmds.rowLayout(numberOfColumns=3, columnWidth3=tmpRowWidth)
    cmds.button(label='SubD Off', width=tmpRowWidth[0],annotation="Turn off render-time subdivisions on the selected objects", command=subd_off)
    cmds.button(label='SubD On', width=tmpRowWidth[1],annotation="Turn on render-time subdivisions on the selected objects", command=catclark_on)
    cmds.intSliderGrp('subIter', minValue=0, maxValue=10, value=3, step=1, field=True, width=tmpRowWidth[2], changeCommand=subd_iter)
    cmds.setParent(mainCL)

    #BUCKET SIZE

    cmds.text(label='--- Bucket Size ---', width=winWidth, height=rowHeight)

    cmds.rowLayout(numberOfColumns=4, columnWidth=[4, winWidth*0.25])
    cmds.button(label='16', width=winWidth*0.25, annotation="Sets bucket size to 16", command=bucket_size16)
    cmds.button(label='32', width=winWidth*0.25, annotation="Sets bucket size to 32", command=bucket_size32)
    cmds.button(label='64', width=winWidth*0.25, annotation="Sets bucket size to 64", command=bucket_size64)
    cmds.button(label='128', width=winWidth*0.25, annotation="Sets bucket size to 128", command=bucket_size128)
    cmds.setParent(mainCL)

    #UTILITIES

    cmds.text(label='--- Utilities ---', width=winWidth, height=rowHeight)

    #checker shader
    tmpRowWidth = [winWidth*0.5, winWidth*0.5]
    cmds.rowLayout(numberOfColumns=2, columnWidth2=tmpRowWidth)
    cmds.button(label='Load Checker Shader', width=tmpRowWidth[0],annotation="Load shader with checker texture - useful for checking UVs", command=checker)
    cmds.button(label='Remove Checker Shader', width=tmpRowWidth[1], annotation="Remove shader with checker texture", command=remove_checker)
    cmds.setParent(mainCL)

    cmds.text(label='--- MtoA Constant Color ---', width=winWidth, height=rowHeight)

    #primvars (constant color1)
    cmds.rowLayout(numberOfColumns=4, columnWidth=[4, winWidth*0.25])
    cmds.button(label='mcc1 0', width=winWidth*0.25, annotation="Adds Mtoa Constant Color - Black", command=color_mcc10)
    cmds.button(label='mcc1 R', width=winWidth*0.25, annotation="Adds Mtoa Constant Color - Red",command=color_mcc1r)
    cmds.button(label='mcc1 G', width=winWidth*0.25, annotation="Adds Mtoa Constant Color - Green",command=color_mcc1g)
    cmds.button(label='mcc1 B', width=winWidth*0.25, annotation="Adds Mtoa Constant Color - Blue",command=color_mcc1b)
    cmds.setParent(mainCL)

    cmds.rowLayout(numberOfColumns=4, columnWidth=[4, winWidth*0.25])
    cmds.button(label='mcc2 0', width=winWidth*0.25, annotation="Adds Mtoa Constant Color2 - Black",command=color_mcc20)
    cmds.button(label='mcc2 R', width=winWidth*0.25, annotation="Adds Mtoa Constant Color2 - Red",command=color_mcc2r)
    cmds.button(label='mcc2 G', width=winWidth*0.25, annotation="Adds Mtoa Constant Color2 - Green",command=color_mcc2g)
    cmds.button(label='mcc2 B', width=winWidth*0.25, annotation="Adds Mtoa Constant Color2 - Blue",command=color_mcc2b)
    cmds.setParent(mainCL)

    # Display the window
    cmds.showWindow(w)
    cmds.window(w, edit=True, widthHeight=(winWidth, winHeight))

