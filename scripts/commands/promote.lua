------------------------------
--
-- @promote <player> <level>
-- Promotes a player to a new GM level
-- Cannot promote higher than or to the level of the player using this command
--
------------------------------

function onTrigger(player,targetname,level)
	local target = GetPlayerByName(targetname);

	if(level < 0) then
		level = 0;
	end;
	if(target:getGMLevel() < player:getGMLevel()) then -- cannot change the level of a higher GM
		if(level < player:getGMLevel()) then -- cannot set a player to higher than yourself
			target:setGMLevel(level);
			printf("Target: %s || New level: %u",target:getName(),level);
		else
			printf("Target's new level is too high");
		end;
	else
		printf("%s attempting to adjust higher GM: %s",player:getName(),target:getName());
	end;
end;
