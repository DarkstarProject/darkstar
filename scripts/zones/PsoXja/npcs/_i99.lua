-----------------------------------
-- Area: Pso'Xja
--  NPC: Stone Gate
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/PsoXja/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and player:getVar("PromathiaStatus")==4) then
        player:startEvent(2);
    elseif (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==3) then
        player:startEvent(106); -- Start Floor 1, 3
    elseif (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==5) then
        player:startEvent(109); -- Start Floor 1, 3 or 4
    elseif (player:hasCompletedMission(COP,DESIRES_OF_EMPTINESS) or (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==7)) then
        player:startEvent(112); -- Start Floor 1, 3, 4, or 5
    elseif (player:hasCompletedMission(COP,THE_ENDURING_TUMULT_OF_WAR)or player:hasCompletedMission(COP,THE_LAST_VERSE)) then
        player:startEvent(50); -- Start Floor 1
    else
        player:messageSpecial(DOOR_LOCKED);
    end
  return 1;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- Retail packet captures have been marked {R}. Please don't change them.
    if (csid == 2 and option == 1 ) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,THE_ENDURING_TUMULT_OF_WAR);
        player:addMission(COP,DESIRES_OF_EMPTINESS);
        player:addKeyItem(LIGHT_OF_VAHZL);
        player:messageSpecial(LIGHT_OF_VAHZL);
        player:setPos(-14.744,0.036,-119.736,1,22); -- To Floor 1 {R}
    elseif (csid == 50 and option == 1) then
        player:setPos(-14.744,0.036,-119.736,1,22); -- To Floor 1 {R}
    elseif (csid == 106) then
        if (option == 1) then
            player:setPos(-14.744,0.036,-119.736,1,22); -- To Floor 1 {R}
        elseif (option == 2) then
            player:setPos(183.546,0,-59.906,0,22); -- To Floor 3 (Propagator) {R}
        end
    elseif (csid == 109) then
        if (option == 1) then
            player:setPos(-14.744,0.036,-119.736,1,22); -- To Floor 1 {R}
        elseif (option == 2) then --floor 3
            player:setPos(183.546,0,-59.906,0,22); -- To Floor 3 (Propagator) {R}
        elseif (option == 2) then
            player:setPos(415.757,0,139.977,128,22); -- To Floor 4 (Solicitor) {R}
        end
    elseif (csid == 112) then
        if (option == 1) then
            player:setPos(-14.744,0.036,-119.736,1,22); -- To Floor 1 {R}
        elseif (option == 2) then --floor 3
            player:setPos(183.546,0,-59.906,0,22); -- To Floor 3 (Propagator) {R}
        elseif (option == 3) then
            player:setPos(415.757,0,139.977,128,22); -- To Floor 4 (Solicitor) {R}
        elseif (option == 4) then
            player:setPos(-336.001,0,139.815,0,22); -- To Floor 5 (Ponderer) {R}
        end
    end
end;