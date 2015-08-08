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

    if (player:getZoneID() == 151 and FireAndBrimstoneCS == 5 and -- zone + quest match
        player:getYPos() > -43 and player:getYPos() < -38 and -- Y match
        player:getXPos() > -85 and player:getXPos() < -73 and -- X match
        player:getZPos() > -85 and player:getZPos() < -75 and -- Z match
        math.random(100) < 50) then

        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1113);
        else
            player:addItem(1113);
            player:messageSpecial(ITEM_OBTAINED,1113);
        end

    else

    local bonuses = (player:getMod(MOD_SCAVENGE_EFFECT)  + player:getMerit(MERIT_SCAVENGE_EFFECT) ) / 100;
    local arrowsToReturn = math.floor(math.floor(player:getLocalVar("ArrowsUsed")  % 10000) * (player:getMainLvl() / 200 + bonuses));
    
        if (arrowsToReturn == 0) then
            action:setMessageID(139);
        else
            if (arrowsToReturn > 99) then
                arrowsToReturn = 99;
            end
            
            local arrowID = math.floor(player:getLocalVar("ArrowsUsed")  / 10000);
            
            player:addItem(arrowID, arrowsToReturn);        
    
            if (arrowsToReturn == 1) then
                action:setParam(arrowID);
                action:setMessageID(140);
            else 
                action:setParam(arrowID);
                action:setMessageID(674);
                action:setAdditionalEffect(1);
                action:setAddEffectParam(arrowsToReturn);
            end
        end
        
        -- Reset use count
        player:setLocalVar("ArrowsUsed", 0);
    end
end;
