---------------------------------
--
-- @togglegm
-- Toggles the nameflags/icon for GM status
-- The flags assigned are based on the player's GM level
--
---------------------------------

FLAG_GM             = 0x04000000;
FLAG_GM_SENIOR      = 0x05000000;
FLAG_GM_LEAD        = 0x06000000;
FLAG_GM_PRODUCER    = 0x07000000;

FLAG_SENIOR         = 0x01000000; -- Do NOT set these flags. These are here to
FLAG_LEAD           = 0x02000000; -- ensure all GM status is removed.

MINLVL_GM          = 1; -- Do NOT change this one.

-------
-- Configurable options
-------
MINLVL_GM_SENIOR   = 2; -- These are configurable so that commands may be restricted
MINLVL_GM_LEAD     = 3; -- between different levels of GM's with the same icon.
MINLVL_GM_PRODUCER = 4;

function onTrigger(player)
	if(player:checkNameFlags(FLAG_GM)) then
		if(player:checkNameFlags(FLAG_GM)) then
			player:setFlag(FLAG_GM);
		end;
		if(player:checkNameFlags(FLAG_SENIOR)) then
			player:setFlag(FLAG_SENIOR);
		end;
		if(player:checkNameFlags(FLAG_LEAD)) then
			player:setFlag(FLAG_LEAD);
		end;
	else
		local gmlvl = player:getGMLevel();
		if(gmlvl >= MINLVL_GM_PRODUCER) then
			player:setFlag(FLAG_GM_PRODUCER);
		elseif(gmlvl >= MINLVL_GM_LEAD) then
			player:setFlag(FLAG_GM_LEAD);
		elseif(gmlvl >= MINLVL_GM_SENIOR) then
			player:setFlag(FLAG_GM_SENIOR);
		elseif(gmlvl >= MINLVL_GM) then
			player:setFlag(FLAG_GM);
		end;
	end;
end;