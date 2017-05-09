-----------------------------------
-- Area: Lower Jeuno
-- NPC: Vingijard
-- Standard Info NPC
-- AF Quests Reset NPC
-----------------------------------

package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;
if player:getMainJob() = 10 and player:getQuestStatus(Jueno,Painful_Memory) == QUEST_COMPLETED and player:getQuestStatus(Jueno,The Requiem) == QUEST_COMPLETED and
 player:getQuestStatus(Jueno,The_Circle_of_Time) == QUEST_COMPLETED and player:getQuestStatus(Jueno,Borghertzs_Harmonious_Hands) == QUEST_COMPLETED then
if trade:hasItem(65535,10000) then player:completeTrade(); 
   player:delquest(Jueno,Painful_Memory);
   player:delquest(Jueno,The_Requiem);
   player:delquest(Jueno,The_Circle_of_Time);
   player:delquest(Jueno,Borghertzs_Harmonious_Hands);
elseif player:getMainJob() = 9 and player:getQuestStatus(Jueno,Wings_of_Gold) == QUEST_COMPLETED and player:getQuestStatus(Jueno,Scattered_into_Shadow) == QUEST_COMPLETED and
 player:getQuestStatus(Jueno,A_New_Dawn) == QUEST_COMPLETED and player:getQuestStatus(Jueno,Borghertzs_Wild_Hands) == QUEST_COMPLETED then
if trade:hasItem(65535,10000) then player:completeTrade(); 
   player:delquest(Jueno,Wings_of_Gold);
   player:delquest(Jueno,Scattered_into_Shadow);
   player:delquest(Jueno,A_New_Dawn);
   player:delquest(Jueno,Borghertzs_Wild_Hands);
elseif player:getMainJob() = 4 and player:getQuestStatus(Jueno,The_Three_Magi) == QUEST_COMPLETED and player:getQuestStatus(Jueno,The_Recollections) == QUEST_COMPLETED and
 player:getQuestStatus(Jueno,The_Root_of_the_Problem) == QUEST_COMPLETED and player:getQuestStatus(Jueno,Borghertzs_Sorcereress_Hands) == QUEST_COMPLETED then
if trade:hasItem(65535,10000) then player:completeTrade(); 
   player:delquest(Jueno,The_Three_Magi);
   player:delquest(Jueno,The_Recollections);
   player:delquest(Jueno,The_Root_of_the_Problem);
   player:delquest(Jueno,Borghertzs_Sorcereress_Hands);
--elseif player:getMainJob() = BLU and player:getQuestStatus(Aht_Urhgan,Beginnings) == QUEST_COMPLETED and player:getQuestStatus(Aht_Urhgan,Omens) == QUEST_COMPLETED and
-- player:getQuestStatus(Aht_Urhgan,Transformations) == QUEST_COMPLETED then
-- if trade:hasItem(65535,10000) then player:completeTrade(); 
 --  player:delquest(Aht_Urhgan,Beginnings);
 --  player:delquest(Aht_Urhgan,Omens);
 --  player:delquest(Aht_Urhgan,Transformations);
--elseif player:getMainJob() = COR and player:getQuestStatus(Aht_Urhgan,Equipped_For_All_Occasions) == QUEST_COMPLETED and player:getQuestStatus(Aht_Urhgan,Navigating_the_Unfriendly_Seas) == QUEST_COMPLETED and
-- player:getQuestStatus(Aht_Urhgan,Against_All_Odds) == QUEST_COMPLETED then
--if trade:hasItem(65535,10000) then player:completeTrade(); 
--   player:delquest(Aht_Urhgan,Equipped_For_All_Occasions);
--   player:delquest(Aht_Urhgan,Navigating_the_Unfriendly_Seas);
--   player:delquest(Aht_Urhgan,Against_All_Odds);
--elseif player:getMainJob() = JOBS.DNC and player:getQuestStatus(Jueno,The_Unfinished_Waltz) == QUEST_COMPLETED and player:getQuestStatus(Jueno,The_Road_to_Divadom) == QUEST_COMPLETED and
-- player:getQuestStatus(Jueno,Comeback_Queen) == QUEST_COMPLETED then
--if trade:hasItem(65535,10000) then player:completeTrade(); 
--   player:delquest(Aht_Urhgan,The_Unfinished_Waltz);
--   player:delquest(Aht_Urhgan,The_Road_to_Divadom);
--   player:delquest(Aht_Urhgan,Comeback_Queen);
elseif player:getMainJob() = 8 and player:getQuestStatus(Bastok,Dark_Legacy) == QUEST_COMPLETED and player:getQuestStatus(Bastok,Dark_Puppet) == QUEST_COMPLETED and
 player:getQuestStatus(Bastok,Blade_of_Evil) == QUEST_COMPLETED and player:getQuestStatus(Bastok,Borghertzs_Shadowy_Hands) == QUEST_COMPLETED then
if trade:hasItem(65535,10000) then player:completeTrade(); 
   player:delquest(Bastok,Dark_Legacy);
   player:delquest(Bastok,The_Recollections);
   player:delquest(Bastok,The_Root_of_the_Problem);
   player:delquest(Bastok,Borghertzs_Shadowy_Hands);
elseif player:getMainJob() = 14 and player:getQuestStatus(Sandoria,A_Craftsmans_Work) == QUEST_COMPLETED and player:getQuestStatus(Sandoria,Chasing_Quotas) == QUEST_COMPLETED and
 player:getQuestStatus(Sandoria,Knight_Stalker) == QUEST_COMPLETED and player:getQuestStatus(Sandoria,Borghertzs_Dragon_Hands) == QUEST_COMPLETED then
if trade:hasItem(65535,10000) then player:completeTrade(); 
   player:delquest(Sandoria,A_Craftsmans_Work);
   player:delquest(Sandoria,Chasing_Quotas);
   player:delquest(Sandoria,Knight_Stalker);
   player:delquest(Sandoria,Borghertzs_Dragon_Hands);
elseif player:getMainJob() = 2 and player:getQuestStatus(Bastok,Ghosts_of_the_Past) == QUEST_COMPLETED and player:getQuestStatus(Bastok,The_First_Meeting) == QUEST_COMPLETED and
 player:getQuestStatus(Bastok,True_Strength) == QUEST_COMPLETED and player:getQuestStatus(Bastok,Borghertzs_Striking_Hands) == QUEST_COMPLETED then
if trade:hasItem(65535,10000) then player:completeTrade(); 
   player:delquest(Bastok,Ghosts_of_the_Past);
   player:delquest(Bastok,The_First_Meeting);
   player:delquest(Bastok,True_Strength);
   player:delquest(Bastok,Borghertzs_Striking_Hands);
elseif player:getMainJob() = 13 and player:getQuestStatus(Norg,20_in_Pirate_Years) == QUEST_COMPLETED and player:getQuestStatus(Norg,Ill_Take_the_Big_Box) == QUEST_COMPLETED and
 player:getQuestStatus(Norg,True_Will) == QUEST_COMPLETED and player:getQuestStatus(Norg,Borghertzs_Lurking_Hands) == QUEST_COMPLETED then
if trade:hasItem(65535,10000) then player:completeTrade(); 
   player:delquest(Norg,20_in_Pirate_Years);
   player:delquest(Norg,Ill_Take_the_Big_Box);
   player:delquest(Norg,True_Will);
   player:delquest(Norg,Borghertzs_Lurking_Hands);
elseif player:getMainJob() = 7 and player:getQuestStatus(Sandoria,Sharpening_the_Sword) == QUEST_COMPLETED and player:getQuestStatus(Sandoria,A_Boys_Dream) == QUEST_COMPLETED and
 player:getQuestStatus(Sandoria,Under_Oath) == QUEST_COMPLETED and player:getQuestStatus(Sandoria,Borghertzs_Stalwart_Hands) == QUEST_COMPLETED then
if trade:hasItem(65535,10000) then player:completeTrade(); 
   player:delquest(Sandoria,Sharpening_the_Sword);
   player:delquest(Sandoria,A_Boys_Dream);
   player:delquest(Sandoria,Under_Oath);
   player:delquest(Sandoria,Borghertzs_Stalwart_Hands);   
--elseif player:getMainJob() = PUP and player:getQuestStatus(Aht_Urhgan,The_Wayward_Automaton) == QUEST_COMPLETED and player:getQuestStatus(Aht_Urhgan,Operation_Teatime) == QUEST_COMPLETED and
-- player:getQuestStatus(Aht_Urhgan,Puppetmaster_Blues) == QUEST_COMPLETED then
--if trade:hasItem(65535,10000) then player:completeTrade(); 
--   player:delquest(Aht_Urhgan,The_Wayward_Automaton);
--   player:delquest(Aht_Urhgan,Operation_Teatime);
--   player:delquest(Aht_Urhgan,,Puppetmaster_Blues);
elseif player:getMainJob() = 11 and player:getQuestStatus(Windurst,Sin_Hunting) == QUEST_COMPLETED and player:getQuestStatus(Windurst,Fire_and_Brimstone) == QUEST_COMPLETED and
 player:getQuestStatus(Windurst,Unbridled_Passion) == QUEST_COMPLETED and player:getQuestStatus(Windurst,Borghertzs_Chasing_Hands) == QUEST_COMPLETED then
if trade:hasItem(65535,10000) then player:completeTrade(); 
   player:delquest(Windurst,Sin_Hunting);
   player:delquest(Windurst,Fire_and_Brimstone);
   player:delquest(Windurst,Unbridled_Passion);
   player:delquest(Windurst,Borghertzs_Chasing_Hands);
elseif player:getMainJob() = 5 and player:getQuestStatus(Sandoria,The_Crimson_Trial) == QUEST_COMPLETED and player:getQuestStatus(Sandoria,Enveloped_in_Darkness) == QUEST_COMPLETED and
 player:getQuestStatus(Sandoria,Peace_for_the_Spirit) == QUEST_COMPLETED and player:getQuestStatus(Windurst,Borghertzs_Vermillion_Hands) == QUEST_COMPLETED then
if trade:hasItem(65535,10000) then player:completeTrade(); 
   player:delquest(Sandoria,The_Crimson_Trial);
   player:delquest(Sandoria,Enveloped_in_Darkness);
   player:delquest(Sandoria,Peace_for_the_Spirit);
   player:delquest(Sandoria,Borghertzs_Vermillion_Hands);
elseif player:getMainJob() = 12 and player:getQuestStatus(Norg,The_Sacred_Katana) == QUEST_COMPLETED and player:getQuestStatus(Norg,Yomi_Okuri) == QUEST_COMPLETED and
 player:getQuestStatus(Norg,A_Thief_in_Norg) == QUEST_COMPLETED and player:getQuestStatus(Norg,Borghertzs_Loyal_Hands) == QUEST_COMPLETED then
if trade:hasItem(65535,10000) then player:completeTrade(); 
   player:delquest(Norg,The_Sacred_Katana);
   player:delquest(Norg,Yomi_Okuri);
   player:delquest(Norg,A_Thief_in_Norg);
   player:delquest(Norg,Borghertzs_Loyal_Hands);
--elseif player:getMainJob() = JOBS.SCH and player:getQuestStatus(The_Crystal_War,On_Sabbatical) == QUEST_COMPLETED and player:getQuestStatus(The_Crystal_War,Downward_Helix) == QUEST_COMPLETED and
-- player:getQuestStatus(The_Crystal_War,Seeing_Blood-red) == QUEST_COMPLETED and player:getQuestStatus(Norg,Borghertzs_Loyal_Hands) == QUEST_COMPLETED then
--if trade:hasItem(65535,10000) then player:completeTrade(); 
--   player:delquest(The_Crystal_War,On_Sabbatical);
--   player:delquest(The_Crystal_War,Downward_Helix);
--   player:delquest(The_Crystal_War,Seeing_Blood-red);
elseif player:getMainJob() = 15 and player:getQuestStatus(Windurst,The_Puppet_Master) == QUEST_COMPLETED and player:getQuestStatus(Windurst,Class_Reunion) == QUEST_COMPLETED and
 player:getQuestStatus(Windurst,Carbuncle_Debacle) == QUEST_COMPLETED and player:getQuestStatus(Windurst,Borghertzs_Calling_Hands) == QUEST_COMPLETED then
if trade:hasItem(65535,10000) then player:completeTrade(); 
   player:delquest(Windurst,The_Puppet_Master);
   player:delquest(Windurst,Class_Reunion);
   player:delquest(Windurst,Carbuncle_Debacle);
   player:delquest(Windurst,Borghertzs_Calling_Hands);
elseif player:getMainJob() = 6 and player:getQuestStatus(Windurst,The_Tenshodo_Showdown) == QUEST_COMPLETED and player:getQuestStatus(Windurst,As_Thick_as_Thieves) == QUEST_COMPLETED and
 player:getQuestStatus(Windurst,Hitting_the_Marquisate) == QUEST_COMPLETED and player:getQuestStatus(Windurst,Borghertzs_Sneaky_Hands) == QUEST_COMPLETED then
if trade:hasItem(65535,10000) then player:completeTrade(); 
   player:delquest(Windurst,The_Tenshodo_Showdown);
   player:delquest(Windurst,As_Thick_as_Thieves);
   player:delquest(Windurst,Hitting_the_Marquisate);
   player:delquest(Windurst,Borghertzs_Sneaky_Hands);
elseif player:getMainJob() = 1 and player:getQuestStatus(Bastok,The_Doorman) == QUEST_COMPLETED and player:getQuestStatus(Bastok,The_Talekeepers_Truth) == QUEST_COMPLETED and
 player:getQuestStatus(Bastok,The_Talekeepers_Gift) == QUEST_COMPLETED and player:getQuestStatus(Bastok,Borghertzs_Shadowy_Hands) == QUEST_COMPLETED then
if trade:hasItem(65535,10000) then player:completeTrade(); 
   player:delquest(Bastok,Dark_Legacy);
   player:delquest(Bastok,The_Recollections);
   player:delquest(Bastok,The_Root_of_the_Problem);
   player:delquest(Bastok,Borghertzs_Shadowy_Hands);
elseif player:getMainJob() = 3 and player:getQuestStatus(Sandoria,Messenger_from_Beyond) == QUEST_COMPLETED and player:getQuestStatus(Sandoria,Prelude_of_Black_and_White) == QUEST_COMPLETED and
 player:getQuestStatus(Sandoria,Pieujes_Decision) == QUEST_COMPLETED and player:getQuestStatus(Windurst,Borghertzs_Healing_Hands) == QUEST_COMPLETED then
if trade:hasItem(65535,10000) then player:completeTrade(); 
   player:delquest(Sandoria,Messenger_from_Beyond);
   player:delquest(Sandoria,Prelude_of_Black_and_White);
   player:delquest(Sandoria,Pieujes_Decision);
   player:delquest(Sandoria,Borghertzs_Healing_Hands);
  end;
end;
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
player:startEvent(0x2732);
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
 end;