-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC:  Magian Moogle (Blue Bobble)
-- Type: Magian Trials NPC (Relic Armor)
-- @pos -6.843 2.459 121.9 64
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
package.loaded["scripts/globals/magiantrials"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/RuLude_Gardens/TextIDs");
require("scripts/globals/magiantrials");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:getItemCount() == 1) then
        local ItemID = trade:getItemId();
        local TrialInfo = getRelicTrialInfo(ItemID);
        local invalid = 0;
        if (TrialInfo.t1 == 0 and TrialInfo.t2 == 0 and TrialInfo.t3 == 0 and TrialInfo.t4 == 0) then
            invalid = 1;
        end
        player:startEvent(10143, TrialInfo.t1, TrialInfo.t2, TrialInfo.t3, TrialInfo.t4, 0, ItemID, 0, invalid);
    else
        -- placeholder for multi item trades such as "Forgotten Hope" etc.
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(MAGIAN_TRIAL_LOG) == false) then
        player:startEvent(10141);
    else
        player:startEvent(10142); -- parameters unknown
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
end;