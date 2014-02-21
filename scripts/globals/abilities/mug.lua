-----------------------------------
-- Ability: Mug
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
    local thfLevel;
    local gil = 0;

    if(player:getMainJob() == JOB_THF) then
        thfLevel = player:getMainLvl();
    else
        thfLevel = player:getSubLvl();
    end

    local mugChance = 90 + thfLevel - target:getMainLvl();

    if(target:isMob() and math.random(100) < mugChance and target:getMobMod(MOBMOD_MUG_GIL) > 0) then
        local purse = target:getMobMod(MOBMOD_MUG_GIL);
        local fatpurse = target:getGil();
        gil = fatpurse / (8 + math.random(0,8));
        if(gil == 0) then
            gil = fatpurse / 2;
        end
        if(gil == 0) then
            gil = fatpurse;
        end
        if(gil > purse) then
            gil = purse;
        end

        if(gil <= 0) then
            ability:setMsg(244);
        else
            if(player:getEquipID(SLOT_HEAD) == 15077) then
                gil = gil * 2;
            end

            player:addGil(gil);
            target:setMobMod(MOBMOD_MUG_GIL, target:getMobMod(MOBMOD_MUG_GIL) - gil);
            ability:setMsg(129);
        end
    else
        ability:setMsg(244);
    end

    return gil;
end;