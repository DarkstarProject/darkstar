-----------------------------------
--  Area: Bastok Markets
--  NPC:  Ulrike
--  Type: Goldsmithing Synthesis Image Support
--  @pos -218.399 -7.824 -56.203 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/status");
require("scripts/globals/crafting");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,6);
    local SkillCap = getCraftSkillCap(player, SKILL_GLD);
    local SkillLevel = player:getSkillLevel(SKILL_GLD);
    
    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_GOLDSMITHING_IMAGERY) == false) then
			player:startEvent(0x0130,SkillCap,SkillLevel,2,201,player:getGil(),0,9,0);
	    else
            player:startEvent(0x0130,SkillCap,SkillLevel,2,201,player:getGil(),6975,9,0);
	    end
	else
        player:startEvent(0x0130);
	end
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

    if (csid == 0x0130 and option == 1) then
        player:messageSpecial(GOLDSMITHING_SUPPORT,0,3,2);
		player:addStatusEffect(EFFECT_GOLDSMITHING_IMAGERY,1,0,120);
    end
end;



