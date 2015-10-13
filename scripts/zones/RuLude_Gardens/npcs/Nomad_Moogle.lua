-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC: Nomad Moogle
-- Type: Adventurer's Assistant
-- @pos 10.012 1.453 121.883 243
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
local meritCount = player:getMeritCount();

if (player:getQuestStatus(JEUNO,NEW_WORLDS_AWAIT) == QUEST_ACCEPTED) then
-- Trade Kindred's Seal x5 / 3 Merit Points
if (trade:hasItemQty(1127,5) and meritCount >= 3 and trade:getItemCount() == 1) then
player:startEvent (10135); -- Finish Quest "New Worlds Await"
end
elseif (player:getQuestStatus(JEUNO,EXPANDING_HORIZONS) == QUEST_ACCEPTED) then
-- Trade Kindred's Crest x5 / 4 Merit Points
if (trade:hasItemQty(2955,5) and meritCount >= 4 and trade:getItemCount() == 1) then
player:startEvent (10136); -- Finish Quest "Expanding Horizons"
end
elseif (player:getQuestStatus(JEUNO,BEYOND_THE_STARS) == QUEST_ACCEPTED) then
-- Trade Kindred's Crest x10 / 5 Merit Points
if (trade:hasItemQty(2955,10) and meritCount >= 5 and trade:getItemCount() == 1) then
player:startEvent (10137); -- Finish Quest "Beyond the Stars"
end
elseif (player:getQuestStatus(JEUNO,DORMANT_POWERS_DISLODGED) == QUEST_ACCEPTED) then
-- Trade Kindred's Crest / 10 Merit Points / Bloody Robe or Crab Apron or Damselfly Worm or Dangruf Stone or Dhalmel Saliva or Faded Crystal or Magicked Skull or Orcish Armor Plate or Orcish Axe or Quadav Backscale or Siren's Tear or Valkurm Sunsand or Wild Rabbit Tail or Yagudo Caulk
if (trade:hasItemQty(2995,1) and meritCount >= 10 and trade:getItemCount() == 1) then
player:startEvent (10138); -- Finish Quest "Dormant Powers Dislodged)"
end
end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local LvL = player:getMainLvl();
local newWorldsAwait = player:getQuestStatus(JEUNO,NEW_WORLDS_AWAIT);
local expandingHorizons = player:getQuestStatus(JEUNO,EXPANDING_HORIZONS);
local beyondTheStars = player:getQuestStatus(JEUNO,BEYOND_THE_STARS);

if (player:hasKeyItem(LIMIT_BREAKER) == false and LvL >= 75) then
player:startEvent(10045,75,2,10,7,30,302895,4095);
else
if (newWorldsAwait == QUEST_AVAILABLE and player:hasKeyItem(LIMIT_BREAKER) == true and LvL >= 75 and player:levelCap() == 75 and MAX_LEVEL >= 80) then
-- player:startEvent(????); -- Start Quest "NEW WORLDS AWAIT"
elseif (newWorldsAwait == QUEST_ACCEPTED) then
-- player:startEvent(????);
elseif (expandingHorizons == QUEST_AVAILABLE and LvL >= 76 and player:levelCap() == 80 and MAX_LEVEL >= 85) then
-- player:startEvent (????); -- Start Quest "EXPANDING HORIZONS"
elseif (expandingHorizons == QUEST_ACCEPTED) then
-- player:startEvent(????);
elseif (beyondTheStars == QUEST_AVAILABLE and LvL >= 81 and player:levelCap() == 85 and MAX_LEVEL >= 90) then
-- player:startEvent(????); -- Start Quest "BEYOND THE STARS"
elseif (beyondTheStars == QUEST_ACCEPTED) then
-- player:startEvent(????);
else
player:startEvent(94);
end
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

if (csid == 10045 and option ~= -1) then
player:addKeyItem(LIMIT_BREAKER);
player:messageSpecial(KEYITEM_OBTAINED,LIMIT_BREAKER);
elseif (csid == 10135 and option == 1) then -- Genkai 6
player:addQuest (JEUNO,NEW_WORLDS_AWAIT);
player:tradeComplete();
player:delitem(KINDREDS_SEAL);
player:setMerits(meritCount - 3)
player:levelCap(80);
player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_80);
player:completeQuest(JEUNO,NEW_WORLDS_AWAIT);
elseif (csid == 10136 and option == 1) then -- Genkai 7
player:addQuest (JEUNO,EXPANDING_HORIZONS);
player:tradeComplete();
player:delitem(KINDREDS_CREST);
player:setMerits(meritCount - 4)
player:levelCap(85);
player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_85);
player:completeQuest(JEUNO,EXPANDING_HORIZONS);
elseif (csid == 10137 and option == 1) then -- Genkai 8
player:addQuest (JEUNO,BEYOND_THE_STARS);
player:tradeComplete();
player:delitem(KINDREDS_CREST);
player:setMerits(meritCount - 5)
player:levelCap(90);
player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_90);
player:completeQuest(JEUNO,BEYOND_THE_STARS);
end
end;
