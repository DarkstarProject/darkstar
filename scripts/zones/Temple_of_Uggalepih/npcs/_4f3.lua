-----------------------------------
-- Area:  Temple of Uggalepih
--  NPC:  _4f3
-- Notes: Tonberry Priest Room (Offers Tonberry Hate Reset)
-- @pos 60.001 -1.653 -147.755 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local killCount = player:getVar("EVERYONES_GRUDGE_KILLS");

    if (player:hasKeyItem(291) == true) then
        if (killCount >= 1) then
            local payment = 250 * ((killCount/20)+1);
            player:startEvent(0x0042,0,payment);
        else
            player:messageSpecial(NO_HATE); -- Hate is already 0
        end
    else
        player:messageSpecial(DOOR_SHUT);
    end

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

    -- TODO: The Priest should cast a spell on the player at the end of the Cutscene.
    if (csid == 0x0042 and option == 1) then
        if (player:delGil(250 * ((player:getVar("EVERYONES_GRUDGE_KILLS")/20)+1))) then
            player:setVar("EVERYONES_GRUDGE_KILLS",0);
            player:messageSpecial(HATE_RESET);
            --GetNPCByID(17428933):castSpell(260);
            local mob = GetNPCByID( 17428933 );
            if (mob ~= nil) then
                --mob:injectActionPacket( 43, 43 );
            else
                printf( "MOB IS NULL! %d", 17428933 );
            end

        end
    end
end;