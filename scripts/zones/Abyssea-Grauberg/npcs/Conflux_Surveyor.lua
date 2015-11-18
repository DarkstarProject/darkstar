-----------------------------------
-- Area: Abyssea - Grauberg
--  NPC: Conflux Surveyor
--
-----------------------------------
package.loaded["scripts/zones/Abyssea-Grauberg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/abyssea");
require("scripts/zones/Abyssea-Grauberg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local visitant = 0;
    local prevtime = player:getVar("Abyssea_Time");
    local STONES = getTravStonesTotal(player);
    local SOJOURN = getAbyssiteTotal(player,"SOJOURN");

    if (player:hasStatusEffect(EFFECT_VISITANT)) then
        visitant = 60;
    end

    player:startEvent(2002,0,visitant,prevtime,STONES,SOJOURN,0,0,0);

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    local SOJOURN = getAbyssiteTotal(player,"SOJOURN");
    local duration = 0;
    local prevtime = player:getVar("Abyssea_Time"); -- Gets reduced by Visitants "on tic".

    if (prevtime > 7200) then
        prevtime = 7200;
        duration = prevtime;
    else
        duration = prevtime;
    end

    duration = duration+(SOJOURN *180);

    if (csid == 2002) then
        if (VISITANT_SYSTEM == false and (option == 65538 or option == 131074 or option == 196610 or option == 262146)) then
            player:addStatusEffect(EFFECT_VISITANT,0,0,0,0,0); -- using 0 should cause an infinate duration.
        elseif (option == 2) then -- Use no stones, use previous remaining time
            player:addStatusEffect(EFFECT_VISITANT,0,3,duration,0,0);
            player:setVar("Abyssea_Time",duration);
        elseif (option == 65538) then -- Use 1 stone
            duration = ((duration + 1800) * VISITANT_BONUS);
            player:addStatusEffect(EFFECT_VISITANT,0,3,duration,0,0);
            player:setVar("Abyssea_Time",duration);
            spendTravStones(player,1);
        elseif (option == 65539) then -- Use 1 stone
            player:PrintToPlayer( "Not implemented yet, sorry!" );
            -- Todo: extend time
        elseif (option == 131074) then -- Use 2 stone
            duration = ((duration + 3600) * VISITANT_BONUS);
            player:addStatusEffect(EFFECT_VISITANT,0,3,duration,0,0);
            player:setVar("Abyssea_Time",duration);
            spendTravStones(player,2);
        elseif (option == 131075) then -- Use 2 stone
            player:PrintToPlayer( "Not implemented yet, sorry!" );
            -- Todo: extend time
        elseif (option == 196610) then -- Use 3 stone
            duration = ((duration + 5400) * VISITANT_BONUS);
            player:addStatusEffect(EFFECT_VISITANT,0,3,duration,0,0);
            player:setVar("Abyssea_Time",duration);
            spendTravStones(player,3);
        elseif (option == 196611) then -- Use 3 stone
            player:PrintToPlayer( "Not implemented yet, sorry!" );
            -- Todo: extend time
        elseif (option == 262146) then -- Use 4 stone
            duration = ((duration + 7200) * VISITANT_BONUS);
            player:addStatusEffect(EFFECT_VISITANT,0,3,duration,0,0);
            player:setVar("Abyssea_Time",duration);
            spendTravStones(player,4);
        end
    end

end;