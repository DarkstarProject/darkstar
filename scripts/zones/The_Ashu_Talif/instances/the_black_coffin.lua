-----------------------------------
-- 
-- Assault: The black coffin
-- 
-----------------------------------

require("scripts/zones/The_Ashu_Talif/IDs"); 

-----------------------------------
-- afterInstanceRegister
-----------------------------------

function afterInstanceRegister(player)
print("checked")
    local instance = player:getInstance();
    
    -- player:messageSpecial(Ashu.text.TIME_TO_COMPLETE, instance:getTimeLimit());

end;	

-----------------------------------
-- onInstanceCreated
-----------------------------------

function onInstanceCreated(instance)
print("imlookedat")

    for i,v in pairs(Ashu.mobs[1]) do
        SpawnMob(v, instance);
		
    end
	
	 gessho = instance:insertAlly(2022)
	  gessho:setSpawn(0,-22,22,66);

	 gessho:spawn()
	 

	
			gessho:setStatus(0)			

	print("test2")
	
	

end;

-----------------------------------
-- onInstanceTimeUpdate
-----------------------------------

function onInstanceTimeUpdate(instance, elapsed)
    local players = instance:getChars();
    local lastTimeUpdate = instance:getLastTimeUpdate();
    local remainingTimeLimit = (instance:getTimeLimit()) * 60 - (elapsed / 1000);
    local wipeTime = instance:getWipeTime();
    local message = 0;

    if (remainingTimeLimit < 0) then
        instance:fail();
        return;
    end
    
    if (wipeTime == 0) then
        local wipe = true;
        for i,v in pairs(players) do
            if v:getHP() ~= 0 then
                wipe = false;
                break;
            end
        end
        if (wipe) then
            for i,v in pairs(players) do
                v:messageSpecial(Ashu.text.PARTY_FALLEN, 3);
            end
            instance:setWipeTime(elapsed);
        end
    else
        if (elapsed - wipeTime) / 1000 > 180 then
            instance:fail();
            return;
        else
            for i,v in pairs(players) do
                if v:getHP() ~= 0 then
                    instance:setWipeTime(0);
                    break;
                end
            end
        end
    end
    
    if (lastTimeUpdate == 0 and elapsed > 20 * 60000) then
        message = 600;
    elseif (lastTimeUpdate == 600 and remainingTimeLimit < 300) then
        message = 300;
    elseif (lastTimeUpdate == 300 and remainingTimeLimit < 60) then
        message = 60;
    elseif (lastTimeUpdate == 60 and remainingTimeLimit < 30) then
        message = 30;
    elseif (lastTimeUpdate == 30 and remainingTimeLimit < 10) then
        message = 10;
    end
    
   -- if (message ~= 0) then
     --   for i,v in pairs(players) do
       --     if (timeRemaining >= 60) then
         --       v:messageSpecial(Ashu.text.TIME_REMAINING_MINUTES, timeRemaining / 60);
           -- else
             --   v:messageSpecial(Ashu.text.TIME_REMAINING_SECONDS, timeRemaining);
        --    end
        --end
        --instance:setLastTimeUpdate(message);
   -- end
	

end;

-----------------------------------
-- onInstanceFailure
-----------------------------------

function onInstanceFailure(instance)

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        v:messageSpecial(Ashu.text.MISSION_FAILED,10,10);
        v:startEvent(0x66);
    end
end;

-----------------------------------
-- onInstanceProgressUpdate
-----------------------------------

function onInstanceProgressUpdate(instance, progress)
local chars = instance:getChars();

    
    if (progress == 5) then
   	 for i,v in pairs(Ashu.mobs[2]) do
        SpawnMob(v, instance);
	  end
	end	

	  end;

-----------------------------------
-- onInstanceComplete
-----------------------------------

function onInstanceComplete(instance)

    local chars = instance:getChars();

    
end;