-----------------------------------
--  Area: Ru'Lude Gardens
--  NPC:  Magian Moogle (Green Bobble)
--  Type: Magian Trials NPC (Job Emotes)
--  @pos -4.558 2.451 111.305 64
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/RuLude_Gardens/TextIDs");
require("scripts/globals/magiantrials");

-----------------------------------
-- onTrade Action
-----------------------------------



-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local LearnerLog = player:hasKeyItem(MAGIAN_LEARNERS_LOG);
    local TrialLog = player:hasKeyItem(MAGIAN_TRIAL_LOG);
    if (player:getMainLvl() < 30) then
        player:startEvent(10151);
    elseif (player:getVar("MetGreenMagianMog") == 0 and LearnerLog == false) then
        if (TrialLog == false) then
            player:startEvent(10160, 0);
        else
            player:startEvent(10160, 1);
        end
    else
        player:startEvent(10152); -- parameters unknown
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    printf("CSID: %u",csid);
    printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    printf("CSID: %u",csid);
    printf("RESULT: %u",option);
    if (csid == 10160 and option == 1) then
        if (player:hasKeyItem(MAGIAN_TRIAL_LOG) == false) then
            player:messageSpecial(KEYITEM_OBTAINED,MAGIAN_LEARNERS_LOG);
            player:addKeyItem(MAGIAN_LEARNERS_LOG);
        end
        player:setVar("MetGreenMagianMog",1);
    --elseif
        --
    end
end;