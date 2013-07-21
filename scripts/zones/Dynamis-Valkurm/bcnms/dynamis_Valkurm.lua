-----------------------------------
-- Area: dynamis_Valkurm
-- Name: dynamis_Valkurm
-----------------------------------



-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)
	
	SetServerVariable("[DynaValkurm]UniqueID",player:getDynamisUniqueID(1286));
	SetServerVariable("[DynaValkurm]Boss_Trigger",0);
	SetServerVariable("[DynaValkurm]Already_Received",0);
	
	    local RNDpositionTable=TimerStatueRandomPos;
		local X=0;
		local Y=0;
		local Z=0;
        local statueID = {16937287,16937262,16937237,16937212};
	--spawn random timer statue
	    local statueRND = math.random(1,4);
		local SpawnStatueID= statueID[statueRND];
		--printf("timer_statue_ID = %u",SpawnStatueID); 
        local F={2,4,6,8};	     
		--printf("position_type = %u",statueRND); 	
		X=RNDpositionTable[F[statueRND]][1];
		--printf("X = %u",X); 
		Y=RNDpositionTable[F[statueRND]][2];
		--printf("Y = %u",Y); 
		Z=RNDpositionTable[F[statueRND]][3];
        --printf("Z = %u",Z); 
					SpawnMob(SpawnStatueID);
					 GetMobByID(SpawnStatueID):setPos(X,Y,Z);
					GetMobByID(SpawnStatueID):setSpawn(X,Y,Z);	
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function OnBcnmEnter(player,instance)
	
	player:setVar("DynamisID",GetServerVariable("[DynaValkurm]UniqueID"));
	player:setVar("dynaWaitxDay",os.time());
	
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function OnBcnmLeave(player,instance,leavecode)
--print("leave code "..leavecode);
	
	if(leavecode == 2 or leavecode == 3 or leavecode == 4) then
		player:setPos(119,-9,131,52,0x67);
	end
	if(leavecode == 4) then
		SetServerVariable("[DynaValkurm]UniqueID",0);
	end
	
end;