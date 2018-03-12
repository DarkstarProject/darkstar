---------------------------------------------
-- Astral Flow
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

local avatarOffsets =
{
    [17506670] = '5', -- Kirin
    [17444883] = '3', -- Vermilion-eared Noberry
    [17453078] = '3', -- Duke Dantalian
    [17453085] = '3', -- Duke Dantalian
    [17453092] = '3', -- Duke Dantalian
}

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_ASTRAL_FLOW;
    skill:setMsg(msgBasic.USES);
    local mobID = mob:getID();
    local avatar = 0;

    if (avatarOffsets[mobID] ~= nil) then
        avatar = mob:getID() + avatarOffsets[mobID];
    else
        avatar = mob:getID() + 2; -- default offset
    end;

    if (not GetMobByID(avatar):isSpawned()) then
        GetMobByID(avatar):setSpawn(mob:getXPos()+1, mob:getYPos(), mob:getZPos()+1, mob:getRotPos());
        SpawnMob(avatar):updateEnmity(mob:getTarget());
    end;

    return typeEffect;
end;
