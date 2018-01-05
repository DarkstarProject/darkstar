-----------------------------------
-- Area:  Temple of Uggalepih
--  NPC:  _4f3
-- Notes: Tonberry Priest Room (Offers Tonberry Hate Reset)
-- !pos 60.001 -1.653 -147.755 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/zones/Temple_of_Uggalepih/MobIDs");
require("scripts/globals/keyitems");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local killCount = player:getVar("EVERYONES_GRUDGE_KILLS");

    if (player:hasKeyItem(TONBERRY_KEY)) then
        if (killCount >= 1) then
            local payment = 250 * ((killCount/20)+1);
            player:startEvent(66,0,payment);
        else
            player:messageSpecial(NO_HATE); -- Hate is already 0
        end
    else
        player:messageSpecial(DOOR_SHUT);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    -- TODO: The Priest should cast a spell on the player at the end of the Cutscene.
    if (csid == 66 and option == 1) then
        if (player:delGil(250 * ((player:getVar("EVERYONES_GRUDGE_KILLS")/20)+1))) then
            player:setVar("EVERYONES_GRUDGE_KILLS",0);
            player:messageSpecial(HATE_RESET);
            --GetNPCByID(PLONGEUR_MONBERRY):castSpell(260);
            local mob = GetNPCByID(PLONGEUR_MONBERRY);
            if (mob ~= nil) then
                --mob:injectActionPacket( 43, 43 );
            else
                printf( "MOB IS NULL! %d", PLONGEUR_MONBERRY );
            end
        end
    end
end;
