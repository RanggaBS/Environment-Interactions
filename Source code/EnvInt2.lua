-- Last edited: Saturday, 18 Deceber 2021

--[[
	Environment Interactions
	Author: RBS ID
]]

local gData = {
	Coord = {
		WB1 = {204.6, -68.4, 35.7},
		WB2 = {183, -80.3, 41.1},
		BellsCtrl = {200.7, -73.5, 46.47},
		ScaffoldsCtrl = {180.13, -73.45, 46.6},
		Scaffold1 = {178.2, -73.3, 40.22},
		Scaffold2 = {178.2, -73.3, 35.55},
		Scaffold3 = {178.2, -73.3, 30.6},

		FoFH = {123.3, 435.4, 6.65},
		fhInMouth = {-703.7, -537.9, 8.3},
		fhCamPos = {-743, -505, 27},
		fhCamLook = {-748, -510, 26},
		reeperCtrl = {-766.5, -503.1, 24.72},
		ctrlDoorOut = {-755.1, -503.3, 24.8},
		ctrlDoorIn = {-762.16, -503.16, 24.7},
		coffinToMaze = {-752.4, -501.4, 24.8},
		mazeDoorStart = {-752.5, -495.2, 15.5},
		mazeDoorExit = {-764.6, -460.7, 15.5},
		minerDoorStart = {-764.6, -452.3, 15.5},
		minerDoorExit = {-722.5, -397.1, 9.45},
		afterMinerDoor = {-718.3, -397.1, 9.4},
		curtainCtrlF = {-703.5, -413.6, 10.8},
		curtainCtrlB = {-708.5, -408, 10.8},
		fhDoorExit = {-689.4, -413.6, 11}
	}
}

local thread = {
	SchoolRooftop = nil
	FunHousefun = nil
	Trees = nil
}

local fellTheWB1, fellTheWB2 = false, false
local fallTheBells = false
local crashTheScaffolds = false

local dropTheLadder = false
local activatesTheReepers = false
local l_0_12 = -1
local whichMiners;
local activatesTheFirstMiners, activatesTheSecondMiners, activatesTheThirdMiners = false, false, false
local openTheCurtains = false

-- --------------------------------------------------------------------------------------------------------------------------------------------------

function SpawnBlips()
	if not MissionActiveSpecific("6_B") then
		BlipAddXYZ(gData.Coord.BellsCtrl[1], gData.Coord.BellsCtrl[2], gData.Coord.BellsCtrl[3], 1, 0, 12) -- Bells control
		BlipAddXYZ(gData.Coord.ScaffoldsCtrl[1], gData.Coord.ScaffoldsCtrl[2], gData.Coord.ScaffoldsCtrl[3], 1, 0, 12) -- Scaffolds control
		--BlipAddXYZ(gData.Coord.Scaffold1[1], gData.Coord.Scaffold1[2], gData.Coord.Scaffold1[3], 1, 0, 12) -- Scaffold1
		--BlipAddXYZ(gData.Coord.Scaffold2[1], gData.Coord.Scaffold2[2], gData.Coord.Scaffold2[3], 1, 0, 12) -- Scaffold2
		--BlipAddXYZ(gData.Coord.Scaffold3[1], gData.Coord.Scaffold3[2], gData.Coord.Scaffold3[3], 1, 0, 12) -- Scaffold3
	end
	BlipAddXYZ(gData.Coord.FoFH[1], gData.Coord.FoFH[2], gData.Coord.FoFH[3], 1, 0, 12) -- Front of FH
	--BlipAddXYZ(gData.Coord.fhInMouth[1], gData.Coord.fhInMouth[2], gData.Coord.fhInMouth[3], 1, 0, 12) -- Inside mouth room
	--BlipAddPoint(POINTLIST._4_04_GRAVEBLIP2, 0, 1, 0, 12) -- Reepers controller
	--BlipAddXYZ(gData.Coord.reeperCtrl[1], gData.Coord.reeperCtrl[2], gData.Coord.reeperCtrl[3], 1, 0, 12) -- Reepers controller
	BlipAddXYZ(gData.Coord.coffinToMaze[1], gData.Coord.coffinToMaze[2], gData.Coord.coffinToMaze[3], 1, 0, 12) -- Opened coffin to maze room
	BlipAddXYZ(gData.Coord.mazeDoorStart[1], gData.Coord.mazeDoorStart[2], gData.Coord.mazeDoorStart[3], 1, 0, 12) -- Maze door start
	--BlipAddPoint(POINTLIST._4_04_MINEJOCKS, 0, 1, 0, 12) -- MinerCtrl1
	--BlipAddPoint(POINTLIST._4_04_MINEJOCKS, 0, 2, 0, 12) -- MinerCtrl2
	--BlipAddPoint(POINTLIST._4_04_MINEJOCKS, 0, 3, 0, 12) -- MinerCtrl3
	BlipAddXYZ(gData.Coord.curtainCtrlB[1], gData.Coord.curtainCtrlB[2], gData.Coord.curtainCtrlB[3], 1, 0, 12) -- Curtain ctrl back
	BlipAddXYZ(gData.Coord.curtainCtrlF[1], gData.Coord.curtainCtrlF[2], gData.Coord.curtainCtrlF[3], 1, 0, 12) -- Curtain ctrl front

	BlipAddPoint(POINTLIST._3_G3_TREEPED1, 0, 1, 0, 12)
	BlipAddXYZ(449.8, -116.6, 4.72, 1, 0, 12)
	BlipAddPoint(POINTLIST._3_G3_TREEPED3, 0, 1, 0, 12)
	BlipAddPoint(POINTLIST._3_G3_TREEPED4, 0, 1, 0, 12)
end

-- School Rooftop: ----------------------------------------------------------------------------------------------------------------------------------

--[[function RTpropsInteractions()
	if PlayerIsInAreaXYZ(gData.Coord.BellsCtrl[1], gData.Coord.BellsCtrl[2], gData.Coord.BellsCtrl[3], 1, 0) and IsButtonBeingPressed(9, 0) then
		RTbellsControl()
	elseif PlayerIsInAreaXYZ(gData.Coord.ScaffoldsCtrl[1], gData.Coord.ScaffoldsCtrl[2], gData.Coord.ScaffoldsCtrl[3], 1, 0) and IsButtonBeingPressed(9, 0) then
		ScaffoldsControl()
	elseif PlayerIsInAreaXYZ(gData.Coord.WB1[1], gData.Coord.WB1[2], gData.Coord.WB1[3], 1, 0) and IsButtonBeingPressed(9, 0) then
		whichWB = 1
		WheelBarrowsInteracts()
	elseif PlayerIsInAreaXYZ(gData.Coord.WB2[1], gData.Coord.WB2[2], gData.Coord.WB2[3], 1, 0) and IsButtonBeingPressed(9, 0) then
		whichWB = 2
		WheelBarrowsInteracts()
	end
end]]
--[[function WheelBarrowsInteracts()
	if whichWB == 1 then
		fellTheWB1 = not fellTheWB1
		if fellTheWB1 then
			PedSetFaction(gPlayer, math.random(12))
			PedSetActionNode(gPlayer, "/Global/Nemesis/Special/WheelBarrowInteract", "Act/Anim/Nemesis.act")
			Wait(4300)
			PedSetFaction(gPlayer, 13)
			PedSetActionNode(gPlayer, "/Global", "Act/Globals.act")
			GeometryInstance("WheelBrl", false, 204.58200073242, -68.039596557617, 35.699501037598, true)
		else
			PAnimReset("WheelBrl", 204.58200073242, -68.039596557617, 35.699501037598)
			GeometryInstance("WheelBrl", false, 204.58200073242, -68.039596557617, 35.699501037598, false)
		end
	elseif whichWB == 2 then
		fellTheWB2 = not fellTheWB2
		if fellTheWB2 then
			PedSetFaction(gPlayer, math.random(12))
			PedSetActionNode(gPlayer, "/Global/Nemesis/Special/WheelBarrowInteract", "Act/Anim/Nemesis.act")
			Wait(4300)
			PedSetFaction(gPlayer, 13)
			PedSetActionNode(gPlayer, "/Global", "Act/Globals.act")
			GeometryInstance("WheelBrl", false, 183.54499816895, -80.270599365234, 41.07799911499, true)
		else
			PAnimReset("WheelBrl", 183.54499816895, -80.270599365234, 41.07799911499)
			GeometryInstance("WheelBrl", false, 183.54499816895, -80.270599365234, 41.07799911499, false)
		end
	end
end]]
function RTbellsControl()
	fallTheBells = not fallTheBells
	if fallTheBells then
		F_FallTheBells()
	else
		F_ResetPAnims()
		F_BellSetup()
		F_BellSwingScatter()
	end
end
function F_FallTheBells()
	PAnimSetActionNode("SCBell", 186.27499389648, -71.16429901123, 46.459701538086, 1, "/Global/SCBELL/Idle/DoDamage", "Act/Props/SCBell.act")
	PAnimSetActionNode("SCBell", 191.72500610352, -75.72029876709, 46.459701538086, 1, "/Global/SCBELL/Idle/DoDamage", "Act/Props/SCBell.act")
	PAnimSetActionNode("SCBell", 197.15899658203, -75.72029876709, 46.459701538086, 1, "/Global/SCBELL/Idle/DoDamage", "Act/Props/SCBell.act")
	PAnimSetActionNode("SCBell", 191.72500610352, -73.444702148438, 46.459701538086, 1, "/Global/SCBELL/Idle/DoDamage", "Act/Props/SCBell.act")
	PAnimSetActionNode("SCBell", 186.27499389648, -73.444702148438, 46.459701538086, 1, "/Global/SCBELL/Idle/DoDamage", "Act/Props/SCBell.act")
	GeometryInstance("SCBell", false, 191.72500610352, -73.444702148438, 46.459701538086, true)
	GeometryInstance("SCBell", false, 191.72500610352, -75.72029876709, 46.459701538086, true)
	GeometryInstance("SCBell", false, 186.27499389648, -73.444702148438, 46.459701538086, true)
	GeometryInstance("SCBell", false, 186.27499389648, -71.16429901123, 46.459701538086, true)
	GeometryInstance("SCBell", false, 197.15899658203, -75.72029876709, 46.459701538086, true)
	SoundEmitterStop(197.15899658203, -75.72029876709, 46.459701538086, "BELLSTHREE")
	SoundEmitterStop(191.72500610352, -75.72029876709, 46.459701538086, "BELLSTWO")
	SoundEmitterStop(186.27499389648, -71.16429901123, 46.459701538086, "BELLSONE")
end
F_BellSetup = function()
  	GeometryInstance("SCBell", false, 197.15899658203, -75.72029876709, 46.459701538086, false)
  	GeometryInstance("SCBell2", false, 197.15899658203, -73.444702148438, 46.459701538086, false)
  	GeometryInstance("SCBell2", false, 197.15899658203, -71.16429901123, 46.459701538086, false)
  	GeometryInstance("SCBell", false, 191.72500610352, -75.72029876709, 46.459701538086, false)
  	GeometryInstance("SCBell", false, 191.72500610352, -73.444702148438, 46.459701538086, false)
  	GeometryInstance("SCBell2", false, 191.72500610352, -71.16429901123, 46.459701538086, false)
  	GeometryInstance("SCBell2", false, 186.27499389648, -75.72029876709, 46.459701538086, false)
  	GeometryInstance("SCBell", false, 186.27499389648, -73.444702148438, 46.459701538086, false)
  	GeometryInstance("SCBell", false, 186.27499389648, -71.16429901123, 46.459701538086, false)
end
F_ResetPAnims = function()
  	PAnimReset("SCBell", 197.15899658203, -75.72029876709, 46.459701538086)
  	PAnimReset("SCBell2", 197.15899658203, -73.444702148438, 46.459701538086)
  	PAnimReset("SCBell2", 197.15899658203, -71.16429901123, 46.459701538086)
  	PAnimReset("SCBell", 191.72500610352, -75.72029876709, 46.459701538086)
  	PAnimReset("SCBell", 191.72500610352, -73.444702148438, 46.459701538086)
  	PAnimReset("SCBell2", 191.72500610352, -71.16429901123, 46.459701538086)
  	PAnimReset("SCBell2", 186.27499389648, -75.72029876709, 46.459701538086)
  	PAnimReset("SCBell", 186.27499389648, -73.444702148438, 46.459701538086)
  	PAnimReset("SCBell", 186.27499389648, -71.16429901123, 46.459701538086)
end
F_BellSwingScatter = function()
  	PAnimSetActionNode("SCBell", 197.15899658203, -75.72029876709, 46.459701538086, 1, "/Global/SCBELL/Idle/IdleAnimationChooser/animstart1", "Act/Props/SCBell.act")
  	PAnimSetActionNode("SCBell2", 197.15899658203, -73.444702148438, 46.459701538086, 1, "/Global/SCBELL/Idle/IdleAnimationChooser/animstart2", "Act/Props/SCBell.act")
  	PAnimSetActionNode("SCBell2", 197.15899658203, -71.16429901123, 46.459701538086, 1, "/Global/SCBELL/Idle/IdleAnimationChooser/animstart3", "Act/Props/SCBell.act")
  	PAnimSetActionNode("SCBell", 191.72500610352, -75.72029876709, 46.459701538086, 1, "/Global/SCBELL/Idle/IdleAnimationChooser/animstart4", "Act/Props/SCBell.act")
  	PAnimSetActionNode("SCBell", 191.72500610352, -73.444702148438, 46.459701538086, 1, "/Global/SCBELL/Idle/IdleAnimationChooser/animstart5", "Act/Props/SCBell.act")
  	PAnimSetActionNode("SCBell2", 191.72500610352, -71.16429901123, 46.459701538086, 1, "/Global/SCBELL/Idle/IdleAnimationChooser/animstart6", "Act/Props/SCBell.act")
  	PAnimSetActionNode("SCBell2", 186.27499389648, -75.72029876709, 46.459701538086, 1, "/Global/SCBELL/Idle/IdleAnimationChooser/animstart7", "Act/Props/SCBell.act")
  	PAnimSetActionNode("SCBell", 186.27499389648, -73.444702148438, 46.459701538086, 1, "/Global/SCBELL/Idle/IdleAnimationChooser/animstart8", "Act/Props/SCBell.act")
  	PAnimSetActionNode("SCBell", 186.27499389648, -71.16429901123, 46.459701538086, 1, "/Global/SCBELL/Idle/IdleAnimationChooser/animstart9", "Act/Props/SCBell.act")
	SoundEmitterStart(197.15899658203, -75.72029876709, 46.459701538086, "BELLSTHREE", "BellTower")
	SoundEmitterStart(191.72500610352, -75.72029876709, 46.459701538086, "BELLSTWO", "BellTower")
	SoundEmitterStart(186.27499389648, -71.16429901123, 46.459701538086, "BELLSONE", "BellTower")
end
function ScaffoldsControl()
	crashTheScaffolds = not crashTheScaffolds
	if crashTheScaffolds then
		PAnimApplyDamage("Scaffold", 178.17300415039, -73.16130065918, 40.140300750732, 251)
		PAnimApplyDamage("Scaffold", 178.17300415039, -73.16130065918, 35.276298522949, 251)
		PAnimApplyDamage("Scaffold", 178.17300415039, -73.16130065918, 30.519399642944, 251)
		SoundPlay2D("ScaffoldCrash")
		SoundPlay2D("ScaffoldCrash")
		SoundPlay2D("ScaffoldCrash")
	else
		PAnimReset("Scaffold", 178.17300415039, -73.16130065918, 40.140300750732)
		PAnimReset("Scaffold", 178.17300415039, -73.16130065918, 35.276298522949)
		PAnimReset("Scaffold", 178.17300415039, -73.16130065918, 30.519399642944)
	end
end
function SchoolRooftop_setup()
	F_BellSetup()
	GeometryInstance("WheelBrl", false, 183.54499816895, -80.270599365234, 41.07799911499, false)
	GeometryInstance("WheelBrl", false, 204.58200073242, -68.039596557617, 35.699501037598, false)
	F_BellSwingScatter()
end

-- Fun House: ---------------------------------------------------------------------------------------------------------------------------------------

function FadeInTransition(timer)
	CameraFade(timer, 0)
	Wait(timer + 1)
	PlayerSetControl(0)
end
function FadeOutTransition(timer)
	CameraFade(timer, 1)
	Wait(timer + 1)
	PlayerSetControl(1)
end

function FHtransitions()
	if PlayerIsInAreaXYZ(gData.Coord.fhInMouth[1], gData.Coord.fhInMouth[2], gData.Coord.fhInMouth[3], 1, 37) and IsButtonBeingPressed(9, 0) then
		AreaTransitionXYZ(0, gData.Coord.FoFH[1], gData.Coord.FoFH[2], gData.Coord.FoFH[3])
	elseif PlayerIsInTrigger(TRIGGER._FUNHOUSE_U_TO_G_TRANS) then
		FadeInTransition(500)
		PlayerSetPosPoint(POINTLIST._4_04_GRAVESTARTDBG)
		FadeOutTransition(500)
	elseif PlayerIsInAreaXYZ(gData.Coord.ctrlDoorOut[1], gData.Coord.ctrlDoorOut[2], gData.Coord.ctrlDoorOut[3], 1, 37) and IsButtonBeingPressed(9, 0)--[[and PedMePlaying(gPlayer, "PedPropsActions")]] then
		FadeInTransition(500)
		PlayerSetPosSimple(gData.Coord.ctrlDoorIn[1], gData.Coord.ctrlDoorIn[2], gData.Coord.ctrlDoorIn[3])
		FadeOutTransition(500)
	elseif PlayerIsInAreaXYZ(gData.Coord.ctrlDoorIn[1], gData.Coord.ctrlDoorIn[2], gData.Coord.ctrlDoorIn[3], 1, 37) and IsButtonBeingPressed(9, 0)--[[and PedMePlaying(gPlayer, "PedPropsActions")]] then
		FadeInTransition(500)
		PlayerSetPosSimple(gData.Coord.ctrlDoorOut[1], gData.Coord.ctrlDoorOut[2], gData.Coord.ctrlDoorOut[3])
		FadeOutTransition(500)
	elseif PlayerIsInAreaXYZ(gData.Coord.coffinToMaze[1], gData.Coord.coffinToMaze[2], gData.Coord.coffinToMaze[3], 1, 37) and IsButtonBeingPressed(9, 0) then
		FadeInTransition(500)
		PlayerSetPosSimple(gData.Coord.mazeDoorStart[1], gData.Coord.mazeDoorStart[2], gData.Coord.mazeDoorStart[3])
		FadeOutTransition(500)
	elseif PlayerIsInAreaXYZ(gData.Coord.mazeDoorStart[1], gData.Coord.mazeDoorStart[2], gData.Coord.mazeDoorStart[3], 1, 37) and IsButtonBeingPressed(9, 0) then
		FadeInTransition(500)
		PlayerSetPosSimple(gData.Coord.coffinToMaze[1], gData.Coord.coffinToMaze[2], gData.Coord.coffinToMaze[3])
		FadeOutTransition(500)
	elseif PlayerIsInAreaXYZ(gData.Coord.fhDoorExit[1], gData.Coord.fhDoorExit[2], gData.Coord.fhDoorExit[3], 1, 37) and PedMePlaying(gPlayer, "PedPropsActions") then
		AreaTransitionXYZ(0, gData.Coord.FoFH[1], gData.Coord.FoFH[2], gData.Coord.FoFH[3])
	end
end
function FHpropsInteractions()
	if PlayerIsInTrigger(TRIGGER._FUNHOUSE_UPSIDEDOWN) and IsButtonBeingPressed(9, 0) then
		PAnimSetActionNode(TRIGGER._IFUNHOUS_FLBBOOK, "/Global/FunBook/Inactive", "Act/Props/FunBook.act")
		dropTheLadder = not dropTheLadder
		if dropTheLadder then
			F_DropLadder()
		else
			F_RaiseLadder()
		end
	-- Reepers control:
	elseif PlayerIsInAreaXYZ(--[[-766.547974, -502.104004, 24.723200]]gData.Coord.reeperCtrl[1], gData.Coord.reeperCtrl[2], gData.Coord.reeperCtrl[3], 1, 37) and IsButtonBeingPressed(9, 0) then
		SetReeperCamAndControl()
	-- Maze doors control:
	elseif PlayerIsInTrigger(TRIGGER._FUNHOUSE_HAUNTEDMAZE) and IsButtonBeingPressed(9, 0) --[[or PedMePlaying(gPlayer, "PedPropsActions")]] then
		MazeDoorsControl()
	-- Miners control:
	--elseif PlayerIsInTrigger(TRIGGER._FUNHOUSE_MINESHAFT) then
	elseif PlayerIsInAreaXYZ(-760.213989, -452.282013, 18.098200, 1, 37) and IsButtonBeingPressed(9, 0) then
		whichMiners = 1
		MinersControl()
	elseif PlayerIsInAreaXYZ(-731.984985, -429.843994, 15.382900, 1, 37) and IsButtonBeingPressed(9, 0) then
		whichMiners = 2
		MinersControl()
	elseif PlayerIsInAreaXYZ(-722.494019, -401.492004, 12.582100, 1, 37) and IsButtonBeingPressed(9, 0) then
		whichMiners = 3
		MinersControl()
	-- Curtains control:
	elseif (
	  PlayerIsInAreaXYZ(gData.Coord.curtainCtrlB[1], gData.Coord.curtainCtrlB[2], gData.Coord.curtainCtrlB[3], 1, 37) or
	  PlayerIsInAreaXYZ(gData.Coord.curtainCtrlF[1], gData.Coord.curtainCtrlF[2], gData.Coord.curtainCtrlF[3], 1, 37)
	  ) and IsButtonBeingPressed(9, 0) then
		CurtainsControl()
	end
end
F_DropLadder = function()
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FLBLADER, "/Global/Ladder/AnimatedLadder/NotUsed", "Act/Props/Ladder.act")
end
F_RaiseLadder = function()
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FLBLADER, "/Global/Ladder/AnimatedLadder/NotUseable", "Act/Props/Ladder.act")
end
function SetReeperCamAndControl()
	CameraFade(500, 0)
	PlayerSetControl(0)
	F_MakePlayerSafeForNIS(true)
	Wait(501)
	CameraSetXYZ(
		gData.Coord.fhCamPos[1], gData.Coord.fhCamPos[2], gData.Coord.fhCamPos[3],
		gData.Coord.fhCamLook[1], gData.Coord.fhCamLook[2], gData.Coord.fhCamLook[3]
	)
	--CameraLookAtXYZ(gData.Coord.fhCamLook[1], gData.Coord.fhCamLook[2], gData.Coord.fhCamLook[3])
	CameraFade(500, 1)
	Wait(1500)
	ReepersControl()
	Wait(2000)
	CameraFade(500, 0)
	Wait(501)
	CameraReturnToPlayer()
	F_MakePlayerSafeForNIS(false)
	CameraFade(500, 1)
	PlayerSetControl(1)
	Wait(501)
end
function ReepersControl()
	activatesTheReepers = not activatesTheReepers
	if activatesTheReepers then
		ActivatesReepers()
	else
		DeactivatesReepers()
	end
end
function ActivatesReepers()
	PAnimSetActionNode(TRIGGER._IFUNHOUS_REEPER00, "/Global/FunReapr/Active", "Act/Props/FunReapr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_REEPER00B, "/Global/FunReapr/Active", "Act/Props/FunReapr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_REEPER01, "/Global/FunReapr/Active", "Act/Props/FunReapr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_REEPER01B, "/Global/FunReapr/Active", "Act/Props/FunReapr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_REEPER02, "/Global/FunReapr/Active", "Act/Props/FunReapr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_REEPER02B, "/Global/FunReapr/Active", "Act/Props/FunReapr.act")
end
function DeactivatesReepers()
	PAnimSetActionNode(TRIGGER._IFUNHOUS_REEPER00, "/Global/FunReapr/PowerDown", "Act/Props/FunReapr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_REEPER00B, "/Global/FunReapr/PowerDown", "Act/Props/FunReapr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_REEPER01, "/Global/FunReapr/PowerDown", "Act/Props/FunReapr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_REEPER01B, "/Global/FunReapr/PowerDown", "Act/Props/FunReapr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_REEPER02, "/Global/FunReapr/PowerDown", "Act/Props/FunReapr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_REEPER02B, "/Global/FunReapr/PowerDown", "Act/Props/FunReapr.act")
end

function MazeDoorsControl()
	F_ButtonWasActivated()
	F_TravelThroughMaze()
end
F_ButtonWasActivated = function()
  if l_0_12 == -1 then
	l_0_12 = 1
  elseif l_0_12 == -2 then
	l_0_12 = 2
  end
end
F_TravelThroughMaze = function()
  if l_0_12 == 1 then
	PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR00L, "/Global/FMTrapDr/OpenToEnd", "Act/Prop/FMTrapDr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR01L, "/Global/FMTrapDr/OpenToEnd", "Act/Prop/FMTrapDr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR02L, "/Global/FMTrapDr/OpenToEnd", "Act/Prop/FMTrapDr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR03L, "/Global/FMTrapDr/OpenToEnd", "Act/Prop/FMTrapDr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR00O, "/Global/FMTrapDr/CloseToEnd", "Act/Prop/FMTrapDr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR01O, "/Global/FMTrapDr/CloseToEnd", "Act/Prop/FMTrapDr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR02O, "/Global/FMTrapDr/CloseToEnd", "Act/Prop/FMTrapDr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR03O, "/Global/FMTrapDr/CloseToEnd", "Act/Prop/FMTrapDr.act")
	l_0_12 = -2
  elseif l_0_12 == 2 then
	PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR00L, "/Global/FMTrapDr/CloseToEnd", "Act/Prop/FMTrapDr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR01L, "/Global/FMTrapDr/CloseToEnd", "Act/Prop/FMTrapDr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR02L, "/Global/FMTrapDr/CloseToEnd", "Act/Prop/FMTrapDr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR03L, "/Global/FMTrapDr/CloseToEnd", "Act/Prop/FMTrapDr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR00O, "/Global/FMTrapDr/OpenToEnd", "Act/Prop/FMTrapDr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR01O, "/Global/FMTrapDr/OpenToEnd", "Act/Prop/FMTrapDr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR02O, "/Global/FMTrapDr/OpenToEnd", "Act/Prop/FMTrapDr.act")
	PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR03O, "/Global/FMTrapDr/OpenToEnd", "Act/Prop/FMTrapDr.act")
	l_0_12 = -1
  end
end

function MinersControl()
	if whichMiners == 1 then
		activatesTheFirstMiners = not activatesTheFirstMiners
		if activatesTheFirstMiners then
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERB, "/Global/FunMiner/Active", "Act/Props/FunMiner.act")
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERX1, "/Global/FunMiner/Active", "Act/Props/FunMiner.act")
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERD, "/Global/FunMiner/Active", "Act/Props/FunMiner.act")
		else
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERB, "/Global/FunMiner/ShutOff", "Act/Props/FunMiner.act")
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERX1, "/Global/FunMiner/ShutOff", "Act/Props/FunMiner.act")
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERD, "/Global/FunMiner/ShutOff", "Act/Props/FunMiner.act")
		end
	elseif whichMiners == 2 then
		activatesTheSecondMiners = not activatesTheSecondMiners
		if activatesTheSecondMiners then
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERX2, "/Global/FunMiner/Active", "Act/Props/FunMiner.act")
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERX3, "/Global/FunMiner/Active", "Act/Props/FunMiner.act")
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERG, "/Global/FunMiner/Active", "Act/Props/FunMiner.act")
		else
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERX2, "/Global/FunMiner/ShutOff", "Act/Props/FunMiner.act")
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERX3, "/Global/FunMiner/ShutOff", "Act/Props/FunMiner.act")
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERG, "/Global/FunMiner/ShutOff", "Act/Props/FunMiner.act")
		end
	elseif whichMiners == 3 then
		activatesTheThirdMiners = not activatesTheThirdMiners
		if activatesTheThirdMiners then
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERH, "/Global/FunMiner/Active", "Act/Props/FunMiner.act")
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERI, "/Global/FunMiner/Active", "Act/Props/FunMiner.act")
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERX4, "/Global/FunMiner/Active", "Act/Props/FunMiner.act")
		else
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERH, "/Global/FunMiner/ShutOff", "Act/Props/FunMiner.act")
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERI, "/Global/FunMiner/ShutOff", "Act/Props/FunMiner.act")
			PAnimSetActionNode(TRIGGER._IFUNHOUS_FUNMINERX4, "/Global/FunMiner/ShutOff", "Act/Props/FunMiner.act")
		end
	end
end

function CurtainsControl()
	openTheCurtains = not openTheCurtains
	if openTheCurtains then
		PAnimSetActionNode(TRIGGER._FUNCURTN01, "/Global/FunCurtn/Open", "Act/Props/FunCurtn.act")
		PAnimSetActionNode(TRIGGER._FUNCURTN, "/Global/FunCurtn/Open", "Act/Props/FunCurtn.act")
	else
		PAnimSetActionNode(TRIGGER._FUNCURTN01, "/Global/FunCurtn/Close", "Act/Props/FunCurtn.act")
		PAnimSetActionNode(TRIGGER._FUNCURTN, "/Global/FunCurtn/Close", "Act/Props/FunCurtn.act")
	end
end

-- Trees: -------------------------------------------------------------------------------------------------------------------------------------------

function TreeFallsControl()
	if PlayerIsInAreaXYZ(102.443001, 36.075100, 5.306530, 1, 0) and IsButtonBeingPressed(9, 0) then
		whichTree = 1
		FallTheTree()
	elseif PlayerIsInAreaXYZ(449.8, -116.6, 4.72, 1, 0) and IsButtonBeingPressed(9, 0) then
		whichTree = 2
		FallTheTree()
	elseif PlayerIsInAreaXYZ(436.332001, -180.992004, 3.561270, 1, 0) and IsButtonBeingPressed(9, 0) then
		whichTree = 3
		FallTheTree()
	elseif PlayerIsInAreaXYZ(439.677002, -218.604996, 3.356430, 1, 0) and IsButtonBeingPressed(9, 0) then
		whichTree = 4
		FallTheTree()
	end
end
function FallTheTree()
	if whichTree == 1 then
		fallTheTree1 = not fallTheTree1
		if fallTheTree1 then
			PAnimCreate(TRIGGER._3_G3_TREE1)
			PlayerSetPosPoint(POINTLIST._3_G3_TREEPED1)
			Wait(200)
			PedSetActionNode(gPlayer, "/Global/3_G3_Conv/CustomAnim/Push", "Act/Conv/3_G3.act")
			PAnimSetActionNode(TRIGGER._3_G3_TREE1, "/Global/TreeFall/Damage/Fall", "Act/Props/TreeFall.act")
		else
			PAnimDelete(TRIGGER._3_G3_TREE1)
		end
	elseif whichTree == 2 then
		fallTheTree2 = not fallTheTree2
		if fallTheTree2 then
			PAnimCreate(TRIGGER._3_G3_TREE2)
			PlayerSetPosSimple(449.8, -116.6, 4.72)
			PlayerFaceHeading(1.5)
			Wait(200)
			PedSetActionNode(gPlayer, "/Global/3_G3_Conv/CustomAnim/Push", "Act/Conv/3_G3.act")
			PAnimSetActionNode(TRIGGER._3_G3_TREE2, "/Global/TreeFall/Damage/Fall", "Act/Props/TreeFall.act")
		else
			PAnimDelete(TRIGGER._3_G3_TREE2)
		end
	elseif whichTree == 3 then
		fallTheTree3 = not fallTheTree3
		if fallTheTree3 then
			PAnimCreate(TRIGGER._3_G3_TREE3)
			PlayerSetPosPoint(POINTLIST._3_G3_TREEPED3)
			Wait(200)
			PedSetActionNode(gPlayer, "/Global/3_G3_Conv/CustomAnim/Push", "Act/Conv/3_G3.act")
			PAnimSetActionNode(TRIGGER._3_G3_TREE3, "/Global/TreeFall/Damage/Fall", "Act/Props/TreeFall.act")
		else
			PAnimDelete(TRIGGER._3_G3_TREE3)
		end
	elseif whichTree == 4 then
		fallTheTree4 = not fallTheTree4
		if fallTheTree4 then
			PAnimCreate(TRIGGER._3_G3_TREE4)
			PlayerSetPosPoint(POINTLIST._3_G3_TREEPED4)
			Wait(200)
			PedSetActionNode(gPlayer, "/Global/3_G3_Conv/CustomAnim/Push", "Act/Conv/3_G3.act")
			PAnimSetActionNode(TRIGGER._3_G3_TREE4, "/Global/TreeFall/Damage/Fall", "Act/Props/TreeFall.act")
		else
			PAnimDelete(TRIGGER._3_G3_TREE4)
		end
	end
end

-- --------------------------------------------------------------------------------------------------------------------------------------------------

function main()
	while not SystemIsReady() or AreaIsLoading() do
		Wait(0)
	end
	SchoolRooftop_setup()
	local t_SchRT = CreateThread("T_SchoolRooftop")
	local t_FH = CreateThread("T_FunHouse")
	local t_Trees = CreateThread("T_Trees")
	while true do
		Wait(0)
		if F_PlayerIsDead() then
			TerminateThread(t_SchRT)
			t_SchRT = CreateThread("T_SchoolRooftop")
			TerminateThread(t_FH)
			t_FH = CreateThread("T_FunHouse")
			TerminateThread(t_Trees)
			t_Trees = CreateThread("T_Trees")
		end
	end
end

-- --------------------------------------------------------------------------------------------------------------------------------------------------

function T_SchoolRooftop()
	while true do
		Wait(0)
		if PlayerIsInAreaXYZ(gData.Coord.BellsCtrl[1], gData.Coord.BellsCtrl[2], gData.Coord.BellsCtrl[3], 1, 0) and IsButtonBeingPressed(9, 0) then
			RTbellsControl()
		elseif PlayerIsInAreaXYZ(gData.Coord.ScaffoldsCtrl[1], gData.Coord.ScaffoldsCtrl[2], gData.Coord.ScaffoldsCtrl[3], 1, 0) and IsButtonBeingPressed(9, 0) then
			ScaffoldsControl()
		elseif PlayerIsInAreaXYZ(gData.Coord.WB1[1], gData.Coord.WB1[2], gData.Coord.WB1[3], 1, 0) and IsButtonBeingPressed(9, 0) then
			--whichWB = 1
			--WheelBarrowsInteracts()
			fellTheWB1 = not fellTheWB1
			if fellTheWB1 then
				PedSetFaction(gPlayer, math.random(12))
				PedSetActionNode(gPlayer, "/Global/Nemesis/Special/WheelBarrowInteract", "Act/Anim/Nemesis.act")
				Wait(4300)
				PedSetFaction(gPlayer, 13)
				PedSetActionNode(gPlayer, "/Global", "Act/Globals.act")
				GeometryInstance("WheelBrl", false, 204.58200073242, -68.039596557617, 35.699501037598, true)
			else
				PAnimReset("WheelBrl", 204.58200073242, -68.039596557617, 35.699501037598)
				GeometryInstance("WheelBrl", false, 204.58200073242, -68.039596557617, 35.699501037598, false)
			end
		elseif PlayerIsInAreaXYZ(gData.Coord.WB2[1], gData.Coord.WB2[2], gData.Coord.WB2[3], 1, 0) and IsButtonBeingPressed(9, 0) then
			--whichWB = 2
			--WheelBarrowsInteracts()
			fellTheWB2 = not fellTheWB2
			if fellTheWB2 then
				PedSetFaction(gPlayer, math.random(12))
				PedSetActionNode(gPlayer, "/Global/Nemesis/Special/WheelBarrowInteract", "Act/Anim/Nemesis.act")
				Wait(4300)
				PedSetFaction(gPlayer, 13)
				PedSetActionNode(gPlayer, "/Global", "Act/Globals.act")
				GeometryInstance("WheelBrl", false, 183.54499816895, -80.270599365234, 41.07799911499, true)
			else
				PAnimReset("WheelBrl", 183.54499816895, -80.270599365234, 41.07799911499)
				GeometryInstance("WheelBrl", false, 183.54499816895, -80.270599365234, 41.07799911499, false)
			end
		end
	end
end

function T_FunHouse()
	while true do
		Wait(0)
		if AreaGetVisible() == 0 then
			if PlayerIsInAreaXYZ(gData.Coord.FoFH[1], gData.Coord.FoFH[2], gData.Coord.FoFH[3], 1, 0) and IsButtonBeingPressed(9, 0) then
				if PAnimIsOpen(TRIGGER._FUNTEETH) then
					PAnimCloseDoor(TRIGGER._FUNTEETH)
				else
					PAnimOpenDoor(TRIGGER._FUNTEETH)
				end
			end
		elseif AreaGetVisible() == 37 then
		-- Transitions:
			if PlayerIsInAreaXYZ(gData.Coord.fhInMouth[1], gData.Coord.fhInMouth[2], gData.Coord.fhInMouth[3], 1, 37) and IsButtonBeingPressed(9, 0) then
				AreaTransitionXYZ(0, gData.Coord.FoFH[1], gData.Coord.FoFH[2], gData.Coord.FoFH[3])
			elseif PlayerIsInTrigger(TRIGGER._FUNHOUSE_U_TO_G_TRANS) then
				FadeInTransition(500)
				PlayerSetPosPoint(POINTLIST._4_04_GRAVESTARTDBG)
				FadeOutTransition(500)
			elseif PlayerIsInAreaXYZ(gData.Coord.ctrlDoorOut[1], gData.Coord.ctrlDoorOut[2], gData.Coord.ctrlDoorOut[3], 1, 37) and IsButtonBeingPressed(9, 0)--[[and PedMePlaying(gPlayer, "PedPropsActions")]] then
				FadeInTransition(500)
				PlayerSetPosSimple(gData.Coord.ctrlDoorIn[1], gData.Coord.ctrlDoorIn[2], gData.Coord.ctrlDoorIn[3])
				FadeOutTransition(500)
			elseif PlayerIsInAreaXYZ(gData.Coord.ctrlDoorIn[1], gData.Coord.ctrlDoorIn[2], gData.Coord.ctrlDoorIn[3], 1, 37) and IsButtonBeingPressed(9, 0)--[[and PedMePlaying(gPlayer, "PedPropsActions")]] then
				FadeInTransition(500)
				PlayerSetPosSimple(gData.Coord.ctrlDoorOut[1], gData.Coord.ctrlDoorOut[2], gData.Coord.ctrlDoorOut[3])
				FadeOutTransition(500)
			elseif PlayerIsInAreaXYZ(gData.Coord.coffinToMaze[1], gData.Coord.coffinToMaze[2], gData.Coord.coffinToMaze[3], 1, 37) and IsButtonBeingPressed(9, 0) then
				FadeInTransition(500)
				PlayerSetPosSimple(gData.Coord.mazeDoorStart[1], gData.Coord.mazeDoorStart[2], gData.Coord.mazeDoorStart[3])
				FadeOutTransition(500)
			elseif PlayerIsInAreaXYZ(gData.Coord.mazeDoorStart[1], gData.Coord.mazeDoorStart[2], gData.Coord.mazeDoorStart[3], 1, 37) and IsButtonBeingPressed(9, 0) then
				FadeInTransition(500)
				PlayerSetPosSimple(gData.Coord.coffinToMaze[1], gData.Coord.coffinToMaze[2], gData.Coord.coffinToMaze[3])
				FadeOutTransition(500)
			elseif PlayerIsInAreaXYZ(gData.Coord.fhDoorExit[1], gData.Coord.fhDoorExit[2], gData.Coord.fhDoorExit[3], 1, 37) and PedMePlaying(gPlayer, "PedPropsActions") then
				AreaTransitionXYZ(0, gData.Coord.FoFH[1], gData.Coord.FoFH[2], gData.Coord.FoFH[3])
		-- Props interactions:
			elseif PlayerIsInTrigger(TRIGGER._FUNHOUSE_UPSIDEDOWN) and IsButtonBeingPressed(9, 0) then
				PAnimSetActionNode(TRIGGER._IFUNHOUS_FLBBOOK, "/Global/FunBook/Inactive", "Act/Props/FunBook.act")
				dropTheLadder = not dropTheLadder
				if dropTheLadder then
					F_DropLadder()
				else
					F_RaiseLadder()
				end
			-- Reepers control:
			elseif PlayerIsInAreaXYZ(--[[-766.547974, -502.104004, 24.723200]]gData.Coord.reeperCtrl[1], gData.Coord.reeperCtrl[2], gData.Coord.reeperCtrl[3], 1, 37) and IsButtonBeingPressed(9, 0) then
				SetReeperCamAndControl()
			-- Maze doors control:
			elseif PlayerIsInTrigger(TRIGGER._FUNHOUSE_HAUNTEDMAZE) and IsButtonBeingPressed(9, 0) --[[or PedMePlaying(gPlayer, "PedPropsActions")]] then
				MazeDoorsControl()
			-- Miners control:
			--elseif PlayerIsInTrigger(TRIGGER._FUNHOUSE_MINESHAFT) then
			elseif PlayerIsInAreaXYZ(-760.213989, -452.282013, 18.098200, 1, 37) and IsButtonBeingPressed(9, 0) then
				whichMiners = 1
				MinersControl()
			elseif PlayerIsInAreaXYZ(-731.984985, -429.843994, 15.382900, 1, 37) and IsButtonBeingPressed(9, 0) then
				whichMiners = 2
				MinersControl()
			elseif PlayerIsInAreaXYZ(-722.494019, -401.492004, 12.582100, 1, 37) and IsButtonBeingPressed(9, 0) then
				whichMiners = 3
				MinersControl()
			-- Curtains control:
			elseif (
			  PlayerIsInAreaXYZ(gData.Coord.curtainCtrlB[1], gData.Coord.curtainCtrlB[2], gData.Coord.curtainCtrlB[3], 1, 37) or
			  PlayerIsInAreaXYZ(gData.Coord.curtainCtrlF[1], gData.Coord.curtainCtrlF[2], gData.Coord.curtainCtrlF[3], 1, 37)
			  ) and IsButtonBeingPressed(9, 0) then
				CurtainsControl()
			end
		end
	end
end

function T_Trees()
	while true do
		Wait(0)

	end
end
