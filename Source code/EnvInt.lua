-- Last edited: Saturday, 20 November 2021

--ImportScript("Library/LibPropNewer.lua")

gData = {
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

function EnvironmentInteractions_setup()
	DATLoad("3_G3.DAT")
	--L_PropLoad("tree", nil)
	DATLoad("4_04.DAT")
	DATLoad("5_Ba.DAT")
	--DATInit()
  LoadAnimationGroup("Area_Funhouse")
  --DATLoad("funhouse.DAT", 0)
  --DATLoad("ifunhous.DAT", 0)
  --DATLoad("SP_HouseOfMirrors.DAT")
  --LoadPAnims("SP_HouseOfMirrors.DAT")
	--PAnimCreate(TRIGGER._5_B_SECDOOR1)
	--PAnimCreate(TRIGGER._5_B_SECDOOR2)
	LoadAnims()
	F_BellSetup()
	GeometryInstance("WheelBrl", false, 183.54499816895, -80.270599365234, 41.07799911499, false)
	GeometryInstance("WheelBrl", false, 204.58200073242, -68.039596557617, 35.699501037598, false)
	F_BellSwingScatter()
	CH_Elev1, CH_Elev2 = PAnimGetPoolIndex("CH_Elevator", -761.36602783203, 92.537803649902, 46.84349822998, 5)
	CH_ElevDoor_C1, CH_ElevDoor_C2 = PAnimGetPoolIndex("CH_ElevDoorC", -761.78997802734, 91.76490020752, 7.6157898902893, 5)
	CH_ElevDoor_D1, CH_ElevDoor_D2 = PAnimGetPoolIndex("CH_ElevDoorD", -760.94097900391, 91.76490020752, 7.6157999038696, 5)
	elevDoorIsClosed = false
	whichWB = 1
	fellTheWB1 = false
	fellTheWB2 = false
	fallTheBells = false
	crashTheScaffolds = false
	dropTheLadder = false
			--GeometryInstance("fun_coffinExit", true, -751.2509765625, -502.28500366211, 26.717199325562, false)
			--local grvDoorX, grvDoorY, grvDoorZ = GetPointFromPointList(POINTLIST._4_04_GRVDOORCORONAS, 1)
			--local ctrlRoomX, ctrlRoomY, ctrlRoomZ = GetPointFromPointList(POINTLIST._4_04_CTRLROOMCORONAS, 1)
			--local afterReaperX, afterReaperY, afterReaperZ = GetPointFromPointList(POINTLIST._4_04_AFTERREAPER, 1)
			activatesTheReepers = false
			l_0_12 = -1

	activatesTheFirstMiners = false
	activatesTheSecondMiners = false
	activatesTheThirdMiners = false
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR00L, "/Global/FMTrapDr/CloseToEndQuick", "Act/Prop/FMTrapDr.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR01L, "/Global/FMTrapDr/CloseToEndQuick", "Act/Prop/FMTrapDr.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR02L, "/Global/FMTrapDr/CloseToEndQuick", "Act/Prop/FMTrapDr.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR03L, "/Global/FMTrapDr/CloseToEndQuick", "Act/Prop/FMTrapDr.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR00O, "/Global/FMTrapDr/OpenToEndQuick", "Act/Prop/FMTrapDr.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR01O, "/Global/FMTrapDr/OpenToEndQuick", "Act/Prop/FMTrapDr.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR02O, "/Global/FMTrapDr/OpenToEndQuick", "Act/Prop/FMTrapDr.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPDR03O, "/Global/FMTrapDr/OpenToEndQuick", "Act/Prop/FMTrapDr.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPSW, "/Global/Switch/Inactive", "Act/Prop/Switch.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPSWB, "/Global/Switch/Inactive", "Act/Prop/Switch.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPSW01, "/Global/Switch/Inactive", "Act/Prop/Switch.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPSW02, "/Global/Switch/Inactive", "Act/Prop/Switch.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPSW03, "/Global/Switch/Inactive", "Act/Prop/Switch.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPSW04, "/Global/Switch/Inactive", "Act/Prop/Switch.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPSW05, "/Global/Switch/Inactive", "Act/Prop/Switch.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPSW06, "/Global/Switch/Inactive", "Act/Prop/Switch.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPSW07, "/Global/Switch/Inactive", "Act/Prop/Switch.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPSW01B, "/Global/Switch/Inactive", "Act/Prop/Switch.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPSW02B, "/Global/Switch/Inactive", "Act/Prop/Switch.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPSW03B, "/Global/Switch/Inactive", "Act/Prop/Switch.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPSW04B, "/Global/Switch/Inactive", "Act/Prop/Switch.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPSW05B, "/Global/Switch/Inactive", "Act/Prop/Switch.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPSW06B, "/Global/Switch/Inactive", "Act/Prop/Switch.act")
  PAnimSetActionNode(TRIGGER._IFUNHOUS_FMTRAPSW07B, "/Global/Switch/Inactive", "Act/Prop/Switch.act")

  	fallTheTree1 = false
  	fallTheTree2 = false
  	fallTheTree3 = false
  	fallTheTree4 = false
  	--PAnimCreate(TRIGGER._3_G3_TREE1)
  	--PAnimCreate(TRIGGER._3_G3_TREE2)
  	--PAnimCreate(TRIGGER._3_G3_TREE3)
  	--PAnimCreate(TRIGGER._3_G3_TREE4)
end
function EnvironmentInteractions_main()
	while true do
		Wait(0)
		SpawnBlips()
		if AreaGetVisible() == 0 then
			RTpropsInteractions()
			-- Front of FH:
			if PlayerIsInAreaXYZ(gData.Coord.FoFH[1], gData.Coord.FoFH[2], gData.Coord.FoFH[3], 1, 0) and IsButtonBeingPressed(9, 0) then
				if PAnimIsOpen(TRIGGER._FUNTEETH) then
					PAnimCloseDoor(TRIGGER._FUNTEETH)
				else
					PAnimOpenDoor(TRIGGER._FUNTEETH)
				end

			end
			TreeFallsControl()
			
		--[[ Chem O Plant:
		elseif AreaGetVisible() == 20 then
			-- Open elevator doors:
			if PlayerIsInAreaXYZ(-761.366028, 92.537804, --[46.843498]27.7, 2, 20) and elevDoorIsClosed then
				F_OpenElevatorDoors()
				elevDoorIsClosed = false
			elseif PlayerIsInAreaXYZ(-761.366028, 92.537804, --[25.700001]7.6, 2, 20) and not elevDoorIsClosed then
				F_CloseElevatorDoors()
				elevDoorIsClosed = true
			end

			--[T_ElevatorControl = function()
				if PlayerIsInTrigger(TRIGGER._5_B_LIFTUP) and ButtonBeingPressedTwice(15) then
					PAnimFollowPath(CH_Elev1, CH_Elev2, PATH._5_B_ELEVATOR_DOWN, false)
					PAnimSetPathFollowSpeed(CH_Elev1, CH_Elev2, 1)
				elseif PlayerIsInTrigger(TRIGGER._5_B_LIFTDOWN) and ButtonBeingPressedTwice(15) then
					PAnimFollowPath(CH_Elev1, CH_Elev2, PATH._5_B_ELEVATOR_UP, false)
					PAnimSetPathFollowSpeed(CH_Elev1, CH_Elev2, 1)
				end
			end]
			if IsButtonBeingPressed(8, 0) then
				--if button1 and GetTimer() < button1 + 1000 then
					--if button2 and GetTimer() < button2 + 1000 then
						if PlayerIsInTrigger(TRIGGER._5_B_LIFTUP) then
							PAnimFollowPath(CH_Elev1, CH_Elev2, PATH._5_B_ELEVATOR_DOWN, false)
							PAnimSetPathFollowSpeed(CH_Elev1, CH_Elev2, 1)
						elseif PlayerIsInTrigger(TRIGGER._5_B_LIFTDOWN) then
							PAnimFollowPath(CH_Elev1, CH_Elev2, PATH._5_B_ELEVATOR_UP, false)
							PAnimSetPathFollowSpeed(CH_Elev1, CH_Elev2, 1)
						end
					--else
						--button2 = GetTimer()
					--end
				--else
					--button1 = GetTimer()
				--end
			end]]
		
		-- Fun house
		elseif AreaGetVisible() == 37 then
			FHtransitions()
			FHpropsInteractions()
		end
		SetDoorsUnlocked() -- Unlock some doors
	end
	TextPrintString("THREAD WAS TERMINATED", 3, 1)
end
function EnvironmentInteractions_mod()
	EnvironmentInteractions_setup()
	CreateThread("EnvironmentInteractions_main")
end

function main()
	while AreaIsLoading() or not SystemIsReady() do
		Wait(0)
	end
	EnvironmentInteractions_mod()
	TextPrintString("Environment Interactions\n\nMod by: RBS ID", 3, 1)
	TutorialShowMessage("Environment", 1000, true)
	Wait(500)
	TutorialShowMessage("Interactions", 1000, true)
	Wait(500)
	TutorialShowMessage("Mod by: RBS ID", 1000, true)
	Wait(500)
	CreateThread("No_clip")
	--AreaTransitionXYZ(37, -703.7, -537.9, 8.3)
	--AreaTransitionPoint(20, POINTLIST._5_B_START)
	while true do
		Wait(0)
		--CameraSetFOV(120)
		local Jam, Menit = ClockGet()
		local Px, Py, Pz = PlayerGetPosXYZ()
		if IsButtonBeingPressed(14, 0) and not nampilinMenu then
			SoundPlay2D("RightBtn")
			nampilinMenu = true
		elseif IsButtonBeingPressed(14, 0) and nampilinMenu then
			nampilinMenu = false
			SoundPlay2D("RightBtn")
			TextPrintString("", 0, 1)
		end
		if nampilinMenu then
			if IsButtonBeingPressed(0, 0) then
				ClockSet(ClockGet() - 1)
				SoundPlay2D("ButtonUp")
			elseif IsButtonBeingPressed(1, 0) then
				ClockSet(ClockGet() + 1)
				SoundPlay2D("ButtonUp")
			end
			TextPrintString("Time selector\n".."< "..Jam..":"..Menit.." >\n\n".."Area code: "..AreaGetVisible().."\n".."X: "..Px.."\n".."Y: "..Py.."\n".."Z: "..Pz.."\n".."Heading: "..PedGetHeading(gPlayer), 3, 2)
		end
	end
end

function RTpropsInteractions()
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
end
function WheelBarrowsInteracts()
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
end
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

function SetDoorsUnlocked()
	AreaSetDoorLocked("DT_ChemPlant_DoorL", false)
	AreaSetDoorLocked("5_B_CHEM_DOOR", false)
	AreaSetDoorLockedToPeds(TRIGGER._5_B_CHEM_DOOR, false)
	AreaSetDoorLocked("5_B_CHEM_DOOR_2", false)
	AreaSetDoorLockedToPeds(TRIGGER._5_B_CHEM_DOOR_2, false)
	AreaSetDoorLocked(TRIGGER._5_B_SECDOOR1, false)
	AreaSetDoorLocked(TRIGGER._5_B_SECDOOR2, false)
	AreaSetDoorLocked(TRIGGER._FUNTEETH, false)
	AreaSetDoorLockedToPeds(TRIGGER._FUNTEETH, false)
	AreaSetDoorPathableToPeds(TRIGGER._FUNTEETH, true)
	AreaSetDoorLocked(TRIGGER._DT_IFUNHOUS_FMDOOR, false)
	AreaSetDoorLocked(TRIGGER._IFUNHOUS_CTRLROOM, false)
	AreaSetDoorLocked(TRIGGER._IFUNHOUS_MINEMZE, false)
	AreaSetDoorLocked(TRIGGER._FUN_MAZEENTRYDOOR, false)
	AreaSetDoorLocked(TRIGGER._FUN_MAZEENTRYDOOR, false)
	AreaSetDoorLocked(TRIGGER._IFUNHOUS_MZEMINE, false)
	AreaSetDoorLocked(TRIGGER._IFUNHOUS_MINEEND, false)
end

function LoadAnims()
	LoadAnimationGroup("CLadderA")
	LoadAnimationGroup("Scaffold")
	LoadAnimationGroup("SCBell")
	LoadAnimationGroup("SecDoorL")
	LoadAnimationGroup("SecDoorR")
	LoadAnimationGroup("Reeper")
	LoadAnimationGroup("FLbBook")
	LoadAnimationGroup("FlbLader")
	LoadAnimationGroup("FLbPaint")
	LoadAnimationGroup("FLbTable")
	LoadAnimationGroup("FMCntrl")
	LoadAnimationGroup("FMDoor")
	LoadAnimationGroup("FMTrapDr")
	LoadAnimationGroup("FMTrapSw")
	LoadAnimationGroup("FortTell")
	LoadAnimationGroup("funCart")
	LoadAnimationGroup("funCurtn")
	LoadAnimationGroup("funMiner")
	LoadAnimationGroup("funRocks")
	LoadAnimationGroup("FunTeeth")
	LoadAnimationGroup("FXTestG")

	LoadAnimationGroup("WheelBrl")
	LoadAnimationGroup("Nemesis")
	LoadAnimationGroup("MINI_React")
	LoadAnimationGroup("Px_RedButton")
	LoadAnimationGroup("MINI_Lock")
	LoadAnimationGroup("Px_Rail")
	LoadAnimationGroup("6B_PARA")
	LoadActionTree("Act/AI/AI_Gary.act")
	LoadActionTree("Act/Conv/6_B.act")

	LoadAnimationGroup("Ambient")
	LoadAnimationGroup("Ambient2")
	LoadAnimationGroup("Ambient3")

	LoadAnimationGroup("Hang_Jock")
	LoadAnimationGroup("NPC_Adult")
	LoadAnimationGroup("4_04_FunhouseFun")
	LoadAnimationGroup("NPC_AggroTaunt")
	LoadActionTree("Act/Props/Switch.act")
	LoadActionTree("Act/Props/AsySwtch.act")
	LoadActionTree("Act/Anim/Funhouse.act")

	LoadAnimationGroup("3_G3")
	LoadActionTree("Act/Conv/3_G3.act")
	LoadAnimationGroup("Px_Tree")
	LoadAnimationGroup("TreeFall")
	collectgarbage()
end
--[[
function ButtonBeingPressedTwice(button)
	local button1, button2 = GetTimer(), GetTimer()
	if IsButtonBeingPressed(button, 0) then
		if button1 and GetTimer() < button1 + 1000 then
			if button2 and GetTimer() < button2 + 1000 then
				return true
			else
				button2 = GetTimer()
			end
		else
			button1 = GetTimer()
		end
	end
	return false
end

F_RestoreDefaultCam = function()
  CameraAllowChange(true)
  CameraReturnToPlayer(true)
  Wait(0)
end

F_OpenElevatorDoors = function()
  PAnimFollowPath(CH_ElevDoor_C1, CH_ElevDoor_C2, PATH._5_B_ELEVATOR_C, false)
  PAnimSetPathFollowSpeed(CH_ElevDoor_C1, CH_ElevDoor_C2, 0.5)
  PAnimFollowPath(CH_ElevDoor_D1, CH_ElevDoor_D2, PATH._5_B_ELEVATOR_D, false)
  PAnimSetPathFollowSpeed(CH_ElevDoor_D1, CH_ElevDoor_D2, 0.5)
end
 
F_CloseElevatorDoors = function()
  PAnimFollowPath(CH_ElevDoor_C1, CH_ElevDoor_C2, PATH._5_B_EC_CLOSE, false)
  PAnimSetPathFollowSpeed(CH_ElevDoor_C1, CH_ElevDoor_C2, 0.5)
  PAnimFollowPath(CH_ElevDoor_D1, CH_ElevDoor_D2, PATH._5_B_ED_CLOSE, false)
  PAnimSetPathFollowSpeed(CH_ElevDoor_D1, CH_ElevDoor_D2, 0.5)
end
 
F_InitDoors = function()
  PAnimFollowPath(TRIGGER._5_B_SECDOOR1, PATH._5_B_DOORA_OPEN, false, F_DoorsOpenClosed_Callback)
  PAnimFollowPath(TRIGGER._5_B_SECDOOR2, PATH._5_B_DOORB_OPEN, false, F_DoorsOpenClosed_Callback)
  PAnimSetPathFollowSpeed(TRIGGER._5_B_SECDOOR1, 0)
  PAnimSetPathFollowSpeed(TRIGGER._5_B_SECDOOR2, 0)
  gClosingDoor = false
  SoundLoopPlay2D("ChemDoorClose", false)
  gOpeningDoor = false
  SoundLoopPlay2D("ChemDoorOpen", false)
end
 
F_OpenDoors = function()
  gDoorEnded = false
  if gClosingDoor then
	gClosingDoor = false
	SoundLoopPlay2D("ChemDoorClose", false)
  end
  gOpeningDoor = true
  SoundLoopPlay2D("ChemDoorOpen", true)
  PAnimSetPathFollowSpeed(TRIGGER._5_B_SECDOOR1, 0.5)
  PAnimSetPathFollowSpeed(TRIGGER._5_B_SECDOOR2, 0.5)
end
 
F_CloseDoors = function()
  gDoorEnded = false
  if gOpeningDoor then
	gOpeningDoor = false
	SoundLoopPlay2D("ChemDoorOpen", false)
  end
  gClosingDoor = true
  if l_0_12 then
	SoundLoopPlay2D("ChemDoorClose", true)
  end
  PAnimSetPathFollowSpeed(TRIGGER._5_B_SECDOOR1, -0.5)
  PAnimSetPathFollowSpeed(TRIGGER._5_B_SECDOOR2, -0.5)
end
 
F_DoorsOpenClosed_Callback = function(l_21_0, l_21_1, l_21_2)
  if l_21_2 == 0 then
	gDoorEnded = true
  elseif l_21_2 == 1 then
	gDoorEnded = true
  end
  if gDoorEnded then
	if gOpeningDoor then
	  SoundLoopPlay2D("ChemDoorOpen", false)
	elseif gClosingDoor then
	  SoundLoopPlay2D("ChemDoorClose", false)
	end
	SoundPlay2D("ChemDoorClunk")
  end
end]]

aData = {
	SystemIsLoaded = false,Chapter = ChapterGet(),
	
	Model_Option = 1,Area_Option = 1,Vehicle_Option = 1,
	
	Model = "player",Style = "Player",FPS_Mode = false,H_Regen = GetTimer(),Studies = false,
	StudyArt = false,Vehicle_Siren = false,Unlimited_Ammo = true,Remove_Timer = true,FixBug = true,
	Default_Speed = 100,Rotation = 0,Is_Busy = false,Get_Peds = 999999,Is_Fighting = false,
	T_Limit = 200,CurrentAllies = {},SwitchStyle = GetTimer(),Owned = false,Unlocked = false,
	TimeLimit = GetTimer(),
	RF_Gun = {
		Spud = GetTimer(),Brocket = GetTimer()
	},NoClip = {
		[69] = {Select = 2,[2] = {"NONE",0},[3] = {"UP",0.1},[4] = {"DOWN",-0.1}},
		
		Touch1 = GetTimer(),Touch2 = GetTimer(),FreeCam = false,FCx = nil,FCy = nil,
		FCz = nil,Dist = 120,Active = false,CP = 0,CH = PedGetHeading(gPlayer)
	},
	
	[69] = {Moving = false,LastRun = GetTimer(),LastSprint = GetTimer(),SprintPressed = 0},
	
	James_BETA = {
		Timer = GetTimer(),Combo = 1
	},
	Voice = {
		PlayerHarass = false,Hurts = false,Gifts = false,Stinky = false,Apology = false,
	},
	Func = {
		SwapModel = function(ped,model,style)
			PedSwapModel(ped,model)
			PedSetActionTree(ped,"/Global/"..style,"Act/Anim/"..style..".act")
			if ped == gPlayer then
				aData.Model = model
				aData.Style = style
				
				PedSetAITree(ped,"/Global/PlayerAI","Act/PlayerAI.act")
			end
		end,
		SetStyle = function(ped,style,apply)
			PedSetActionTree(ped,"/Global/"..style,"Act/Anim/"..style..".act")
			if ped == gPlayer then
				PedSetAITree(ped,"/Global/PlayerAI","Act/PlayerAI.act")
				if type(apply) == "boolean" and apply then
					aData.Style = style
				end
			end
		end,
		Transition = function(a,x,y,z,cax,cay,caz,lox,loy,loz)
			CameraAllowChange(true)
			CameraAllowScriptedChange(true)
			PedSetEffectedByGravity(gPlayer,false)
			PedSetActionNode(gPlayer,"/Global/1_06/HoboFly","Act/Conv/1_06.act")
			CameraFade(500,0)
			Wait(501)
			AreaForceLoadAreaByAreaTransition(true)
			AreaDisableCameraControlForTransition(true)
			AreaTransitionXYZ(a,x,y,z - 4)
			AreaDisableCameraControlForTransition(false)
			AreaForceLoadAreaByAreaTransition(false)
			CameraSetXYZ(cax,cay,caz)
			CameraLookAtXYZ(lox,loy,loz)
			Wait(501)
			CameraFade(500,1)
			CameraAllowChange(false)
			CameraAllowScriptedChange(false)
		end,
		Get_Menu = function(SetVisible,Option,Max)
			CounterMakeHUDVisible(SetVisible)
			PlayerWeaponHudLock(SetVisible)
			ToggleHUDComponentVisibility(4,not SetVisible)
			ToggleHUDComponentVisibility(11,not SetVisible)
			ToggleHUDComponentVisibility(0,not SetVisible)
			if SetVisible then
				CounterSetCurrent(Option)
				CounterSetMax(Max)
			end
		end,
		IsMoving = function()
			local s = 0.08 -- sensitivity
			return GetStickValue(16,0) > s or GetStickValue(16,0) < -s or GetStickValue(17,0) > s or GetStickValue(17,0) < -s
		end,
		ForceStop = function(ped)
			if PedIsValid(ped) then
				PedSetActionNode(ped,"/Global","Act/Globals.act")
			end
		end,
		SetNeutral = function(ped)
			for faction = 0,13 do
				PedSetPedToTypeAttitude(ped,faction,2)
			end
		end,
		InClass = function()
			if MissionActiveSpecific("C_English_1") or MissionActiveSpecific("C_English_2") or MissionActiveSpecific("C_English_3") or MissionActiveSpecific("C_English_4") or MissionActiveSpecific("C_English_5") or MissionActiveSpecific("C_ART_1") or MissionActiveSpecific("C_ART_2") or MissionActiveSpecific("C_ART_3") or MissionActiveSpecific("C_ART_4") or MissionActiveSpecific("C_ART_5") or MissionActiveSpecific("C_Math_1") or MissionActiveSpecific("C_Math_2") or MissionActiveSpecific("C_Math_3") or MissionActiveSpecific("C_Math_4") or MissionActiveSpecific("C_Math_5") or MissionActiveSpecific("C_Biology_1") or MissionActiveSpecific("C_Biology_2") or MissionActiveSpecific("C_Biology_3") or MissionActiveSpecific("C_Biology_4") or MissionActiveSpecific("C_Biology_5") or MissionActiveSpecific("C_Geography_1") or MissionActiveSpecific("C_Geography_2") or MissionActiveSpecific("C_Geography_3") or MissionActiveSpecific("C_Geography_4") or MissionActiveSpecific("C_Geography_5") then
				return true
			end
			return false
		end,
		InBio = function()
			if MissionActiveSpecific("C_Biology_1") or MissionActiveSpecific("C_Biology_2") or MissionActiveSpecific("C_Biology_3") or MissionActiveSpecific("C_Biology_4") or MissionActiveSpecific("C_Biology_5") then
				return true
			end
			return false
		end,
		InGeo = function()
			if MissionActiveSpecific("C_Geography_1") or MissionActiveSpecific("C_Geography_2") or MissionActiveSpecific("C_Geography_3") or MissionActiveSpecific("C_Geography_4") or MissionActiveSpecific("C_Geography_5") then
				return true
			end
			return false
		end,
		InArt = function()
			if MissionActiveSpecific("C_ART_1") or MissionActiveSpecific("C_ART_2") or MissionActiveSpecific("C_ART_3") or MissionActiveSpecific("C_ART_4") or MissionActiveSpecific("C_ART_5") then
				return true
			end
			return false
		end,
		ForwardDir2D = function(h,dist)
			return -math.sin(h)*dist,math.cos(h)*dist
		end,
		ForwardDir3D = function(p,h,dist)
			return math.cos(p)*-math.sin(h)*dist,math.cos(p)*math.cos(h)*dist,math.sin(p)*dist
		end,
		GetModelID = function(ped)
			for i = 1,256 do
				if PedIsModel(ped,i) then
					return i
				end
			end
		end,
		FadeIn = function(timer)
			CameraFade(timer,0)
			Wait(timer + 1)
		end,
		FadeOut = function(wait,timer)
			if type(wait) == "number" then
				Wait(wait)
			end
			CameraFade(timer,1)
		end,
		Clear = function(alone)
			if alone then
				StopPedProduction(true)
				AreaClearSpawners()
				AreaClearDockers()
				AreaClearAllPeds()
				AreaClearPatrolPaths()
			else
				StopPedProduction(false)
			end
		end
	}
}

function No_clip()
	while true do
		Wait(0)
		local AllowedToNC = function()
			return not PedIsValid(Target) and not PlayerIsInAnyVehicle() and not aData.Is_Busy and not aData.Is_Fighting and not aData.Func.IsMoving()
		end
		if IsButtonBeingPressed(8,0) and AllowedToNC() then
			
			if aData.NoClip.Touch1 and GetTimer() < aData.NoClip.Touch1 + 500 then
				if aData.NoClip.Touch2 and GetTimer() < aData.NoClip.Touch2 + 500 then
					
					if aData.NoClip.Active then
						CameraReturnToPlayer()
						aData.Func.ForceStop(gPlayer)
						PedSetEffectedByGravity(gPlayer,true)
						
						aData.NoClip.Active = false
					else
						PedSetWeaponNow(gPlayer,-1,0)
						
						aData.NoClip.CP,aData.NoClip.CH = 0,PedGetHeading(gPlayer)
						
						aData.NoClip[69].Select,aData.NoClip.FreeCam,aData.NoClip.Active = 2,false,true
					end
				else
					aData.NoClip.Touch2 = GetTimer()
				end
			else
				aData.NoClip.Touch1 = GetTimer()
			end
		end
		
		if aData.NoClip.Active then
			if IsButtonBeingPressed(11,0) then
				local Option = aData.NoClip[69]
				
				Option.Select = Option.Select + 1
				if Option.Select > 4 then Option.Select = 2 end
			end
			PedSetWeapon(gPlayer,-1,0)
			
			if not PedIsPlaying(gPlayer,"/Global/1_06/HoboFly",true) then
				PedSetActionNode(gPlayer,"/Global/1_06/HoboFly","Act/Conv/1_06.act")
			end
			PedSetEffectedByGravity(gPlayer,false)
			
			aData.NoClip.CP,aData.NoClip.CH = aData.NoClip.CP + (GetStickValue(14,0)-GetStickValue(15,0))/20,aData.NoClip.CH + (GetStickValue(8,0)-GetStickValue(6,0))/20
			local Speed,PPx,PPy,PPz = IsButtonPressed(7,0) and 7 or IsButtonPressed(14,0) and 0.05 or 1,PlayerGetPosXYZ()
			local X1,Y1 = aData.Func.ForwardDir2D(aData.NoClip.CH,GetStickValue(17,0)/10*7)
			local X2,Y2 = aData.Func.ForwardDir2D(aData.NoClip.CH+math.pi/2,GetStickValue(16,0)/10*7)
			
			if IsButtonBeingPressed(2,0) then
				aData.NoClip.FreeCam = not aData.NoClip.FreeCam
				
				if aData.NoClip.FreeCam then
					local Cx,Cy,Cz = aData.Func.ForwardDir3D(aData.NoClip.CP,aData.NoClip.CH,-aData.NoClip.Dist*0.04)
					aData.NoClip.FCx,aData.NoClip.FCy,aData.NoClip.FCz = PPx + Cx,PPy + Cy,PPz + Cz + 1.5
				else
					aData.NoClip.FreeCam,aData.NoClip.FCx,aData.NoClip.FCy,aData.NoClip.FCz = false,nil,nil,nil
				end
				
			elseif aData.NoClip.FreeCam then
				aData.NoClip.FCx,aData.NoClip.FCy,aData.NoClip.FCz = aData.NoClip.FCx + X1 + X2,aData.NoClip.FCy + Y1 + Y2,aData.NoClip.FCz + aData.NoClip[69][aData.NoClip[69].Select][2]
			else
				PPx,PPy,PPz = PPx + X1 + X2,PPy + Y1 + Y2,PPz + aData.NoClip[69][aData.NoClip[69].Select][2]
				
				PlayerFaceHeading(aData.NoClip.CH)
				PlayerSetPosSimple(PPx,PPy,PPz)
			end
			
			local Cx,Cy,Cz = aData.Func.ForwardDir3D(aData.NoClip.CP,aData.NoClip.CH,-aData.NoClip.Dist*0.04)
			local CPx,CPy,CPz,CFx,CFy,CFz = aData.NoClip.FCx or PPx + Cx,aData.NoClip.FCy or PPy + Cy,aData.NoClip.FCz or PPz + Cz + 1.5,aData.NoClip.FCx and aData.NoClip.FCx - Cx or PPx,aData.NoClip.FCy and aData.NoClip.FCy - Cy or PPy,aData.NoClip.FCz and aData.NoClip.FCz - Cz or PPz + 1.5
			CameraSetXYZ(CPx,CPy,CPz,CFx,CFy,CFz)
		end
	end
end
