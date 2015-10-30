-----------------------------------
-- Area: Davoi
-- NPC:  Deloknok
-- Involved in Quest: The First Meeting
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	local theFirstMeeting = killer:getQuestStatus(BASTOK,THE_FIRST_MEETING);
	local martialArtsScroll = killer:hasKeyItem(SANDORIAN_MARTIAL_ARTS_SCROLL);

	if (theFirstMeeting == QUEST_ACCEPTED and martialArtsScroll == false) then
		killer:setVar("theFirstMeetingKilledNM",killer:getVar("theFirstMeetingKilledNM") + 1);
	end

end;