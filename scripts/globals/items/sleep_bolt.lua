-----------------------------------------
-- ID: 18149
-- Item: Sleep Bolt
-- Additional Effect: Sleep
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 95;
	local mobid  = target:getID();
	
	-- If mob is a protected class:
	if (mobid == 17555890) or --Vrtra
		(mobid == 17408019)	or --Nidhogg
		(mobid == 17408018)	or --Fafnir
		(mobid == 17297441)	or --King Behemoth		
		(mobid == 17297440)	or --Behemoth
		(mobid == 17301538)	or --Aspidochelone
		(mobid == 17301537)	or --Adamantoise
		(mobid == 17228242)	or --Simurgh
		(mobid == 17269106)	or --Roc
		(mobid == 17203216)	or --King Arthro		
		(mobid == 17396137)	or --Tzee Xicu the Manifest
		(mobid == 17309983)	or --Suzaku
		(mobid == 17506674)	or --Suzaku (Kirin's Pet)
		(mobid == 17309981)	or --Seiryu
		(mobid == 17506672)	or --Seiryu (Kirin's Pet)
		(mobid == 17309980)	or --Genbu
		(mobid == 17506671)	or --Genbu (Kirin's Pet)
		(mobid == 17309982)	or --Byakko
		(mobid == 17506673)	or --Byakko (Kirin's Pet)
		(mobid == 17506670)	or --Kirin
		(mobid == 17506675)	or --Kirin S Avatar
		(mobid == 17027458)	or --Cerberus
		(mobid == 17289575)	or --King Vinegarroon
		(mobid == 17596720)	or --Serket
		(mobid == 17101201)	--Khimaira		
	then
		spell:setMsg(85);
		return typeEffect;
	end	
	
	-- Otherwise:	
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 95);
    end
    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local duration = 25;
        if (target:getMainLvl() > player:getMainLvl()) then
            duration = duration - (target:getMainLvl() - player:getMainLvl())
        end
        utils.clamp(duration,1,25);
        duration = duration * applyResistanceAddEffect(player,target,ELE_LIGHT,0);
        if (not target:hasStatusEffect(EFFECT_SLEEP_I)) then
            target:addStatusEffect(EFFECT_SLEEP_I, 1, 0, duration);
        end
        return SUBEFFECT_SLEEP, 160, EFFECT_SLEEP_I;
    end
end;