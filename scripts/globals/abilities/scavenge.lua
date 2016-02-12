-----------------------------------
-- Ability: Scavenge
-- Searches the ground around user for items.
-- Obtained: Ranger Level 10
-- Recast Time: 3:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability,action)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player, target, ability, action)

    -- RNG AF2 quest check
    local FireAndBrimstoneCS = player:getVar("fireAndBrimstone");
    local oldEarring = 1113;

    if (player:getZoneID() == 151 and FireAndBrimstoneCS == 5 and-- zone + quest match
        player:hasItem(oldEarring) == false and -- make sure player doesn't already have the earring
        player:getYPos() > -43 and player:getYPos() < -38 and -- Y match
        player:getXPos() > -85 and player:getXPos() < -73 and -- X match
        player:getZPos() > -85 and player:getZPos() < -75 and -- Z match
        math.random(100) < 50) then

        local ITEM_CANNOT_BE_OBTAINED = 6564;
        local ITEM_OBTAINED = 6569;

        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, oldEarring);
            return;
        else
            player:addItem(oldEarring);
            player:messageSpecial(ITEM_OBTAINED, oldEarring);
        end;

    else

    local bonuses = (player:getMod(MOD_SCAVENGE_EFFECT)  + player:getMerit(MERIT_SCAVENGE_EFFECT) ) / 100;
    local arrowsToReturn = math.floor(math.floor(player:getLocalVar("ArrowsUsed")  % 10000) * (player:getMainLvl() / 200 + bonuses));
    local playerID = target:getID();

        if (arrowsToReturn == 0) then
            action:messageID(playerID,139);
        else
            if (arrowsToReturn > 99) then
                arrowsToReturn = 99;
            end;

            local arrowID = math.floor(player:getLocalVar("ArrowsUsed") / 10000);
            player:addItem(arrowID, arrowsToReturn);
            
            if (arrowsToReturn == 1) then
                action:messageID(playerID,140);
            else
                action:messageID(playerID, 674);
                action:additionalEffect(playerID, 1);
                action:addEffectParam(playerID, arrowsToReturn);
            end;
        player:setLocalVar("ArrowsUsed", 0);
        return arrowID;
        end;
    end;
end;
