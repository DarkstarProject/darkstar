---------------------------------------------------------------------------------------------------
-- func: @jinx <victim> <type> <power>
-- desc: Does mean things to annoying player.
-- If player re-logs zones or job changes, jinx will be removed.
-- DO NOT TELL PLAYER THIS.
-- DO NOT TELL PLAYER WHAT THIS COMMAND DOES.
-- DO NOT EVEN TELL PLAYER THIS COMMAND EXISTS.
-- Default type of jinx used is "Agro Magnet" :)
-- Power and Duration are only for status effect type jinxing.
--
-- Please excuse the shoddy pile of if"s and crap - it was thrown together to do the job and just work, not look pretty.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = "ssi"
};

function onTrigger(player, victim, jinx, power)
    if (victim == nil) then
        player:PrintToPlayer("Must specify a victim!");
        player:PrintToPlayer("@jinx <victim> <agro crit speed interrupt>");
        player:PrintToPlayer("If player re-logs zones or job changes, jinx will be removed.");
        player:PrintToPlayer("DO NOT TELL PLAYER THIS.");
        player:PrintToPlayer("DO NOT TELL PLAYER WHAT THIS COMMAND DOES.");
        player:PrintToPlayer("DO NOT EVEN TELL PLAYER THIS COMMAND EXISTS.");
    else
        local targ = GetPlayerByName(victim);
        if (targ ~= nil) then
            if (targ:getGMLevel() > player:getGMLevel()) then
                player:PrintToPlayer("You can't jinx a GM of a higher Tier than yourself.");
                player:PrintToPlayer(string.format("Everything you throw at %s bounces off and sticks to you..", victim));
                targ = player;
            end

            if (jinx == nil) then
                jinx = "agro";
            end


            if (jinx == "all") then
                power = 15;
                targ:addMod(MOD_STEALTH, -2000);
                player:PrintToPlayer(string.format("Victim '%s' now has increased agro range.", victim));
                targ:addMod(MOD_ENEMYCRITRATE, 80);
                targ:addMod(MOD_CRITHITRATE, -power);
                player:PrintToPlayer(string.format("Victim '%s' now receive more critical hits.", victim));
                player:PrintToPlayer(string.format("Victim '%s' now delivers fewer critical hits.", victim));
                targ:addMod(MOD_MOVE, -power);
                player:PrintToPlayer(string.format("Victim '%s' now has decreased movement speed.", victim));
                targ:addMod(MOD_SPELLINTERRUPT, -80);
                player:PrintToPlayer(string.format("Victim '%s' now has increased spell interuption chance.", victim));
            elseif (jinx == "agro") then
                    power = 1500;
                targ:addMod(MOD_STEALTH, -1600);
                player:PrintToPlayer(string.format("Victim '%s' now has increased agro range.", victim));
            elseif (jinx == "crit") then
                if (power == nil or power == 0) then
                    power = 10;
                elseif (power > 80) then
                    power = 80;
                end
                targ:addMod(MOD_ENEMYCRITRATE, power);
                targ:addMod(MOD_CRITHITRATE, -power);
                player:PrintToPlayer(string.format("Victim '%s' now receive more critical hits.", victim));
                player:PrintToPlayer(string.format("Victim '%s' now delivers fewer critical hits.", victim));
            elseif (jinx == "speed") then
                if (power == nil or power == 0) then
                    power = 10;
                elseif (power > 50) then
                    power = 50;
                end
                targ:addMod(MOD_MOVE, -power);
                player:PrintToPlayer(string.format("Victim '%s' now has decreased movement speed.", victim));
            elseif (jinx == "interrupt") then
                if (power == nil or power == 0) then
                    power = 25;
                elseif (power > 80) then
                    power = 80;
                end
                targ:addMod(MOD_SPELLINTERRUPT, -power);
                player:PrintToPlayer(string.format("Victim '%s' now has increased spell interruption chance.", victim));
            else
                player:PrintToPlayer("@jinx <victim> <agro crit speed interrupt>");
                player:PrintToPlayer("If player re-logs zones or job changes, jinx will be removed.");
                player:PrintToPlayer("DO NOT TELL PLAYER THIS.");
                player:PrintToPlayer("DO NOT TELL PLAYER WHAT THIS COMMAND DOES.");
                player:PrintToPlayer("DO NOT EVEN TELL PLAYER THIS COMMAND EXISTS.");
            end
        else
            player:PrintToPlayer(string.format("Victim named '%s' not found!", victim));
            player:PrintToPlayer("@jinx <victim> <type>");
        end
    end
end;