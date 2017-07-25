---------------------------------------------------------------------------------------------------
-- func: haskeyitem <ID> <player>
-- desc: Checks if player has specified KeyItem.
--       Can use either of number or the variable string from keyitems.lua
---------------------------------------------------------------------------------------------------

require("scripts/globals/keyitems");

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function onTrigger(player, KI, target)
    KI = string.upper(KI);
    local keyId = tonumber(KI) or _G[string.upper(KI)];

    if (keyId == nil) then
        player:PrintToPlayer("You must enter a valid KeyItem to check.");
        player:PrintToPlayer("@haskeyitem <KeyItem> <player>");
        return;
    end

    local targ;
    if (target == nil) then
        targ = player;
    else
        targ = GetPlayerByName(target);
    end

    if (targ ~= nil) then
        if (targ:hasKeyItem(keyId)) then
            player:PrintToPlayer(string.format("Player has KeyItem '%s'", KI));
        else
            player:PrintToPlayer(string.format("Player does not have KeyItem '%s'", KI));
        end
    else
        player:PrintToPlayer(string.format("Player named '%s' not found!", target));
        player:PrintToPlayer("@haskeyitem <ID> <player>");
    end
end;
