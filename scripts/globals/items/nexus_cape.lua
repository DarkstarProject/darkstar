-----------------------------------------
-- ID: 11538
-- Item: Nexus Cape
-- Enchantment: "Teleport" (Party Leader)
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/teleports");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local leader = target:getPartyLeader();
    local leaderZone = GetPlayerByName(target:getPartyLeader()):getZoneID();
    local validZoneList =
    {
        005,007,100,101,102,103,104,105,106,107,108,110,111,112,113,114,
        115,116,117,118,119,120,123,124,126,127,128,230,231,232,234,235,
        236,238,239,240,241,243,244,245,246,247,248,249,250,252,257
    }

    if (leader == nil) then
        return 56; -- Not in a party, fail.
    elseif (target:getID() == GetPlayerByName(leader):getID()) then
        return 56; -- User is leader, fail.
    end

    for _, validZone in ipairs( validZoneList ) do
        if (validZone == leaderZone) then
            return 0; -- All good, teleporting!
        end
    end

    return 56; -- Leader wasn't in a valid zone, fail.
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_TO_LEADER,0,1);
end;