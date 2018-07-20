function onAbilityCheck(player,target,ability)
    if (target == nil or target:getID() == player:getID() or not target:isPC()) then
        return dsp.msg.basic.CANNOT_ON_THAT_TARG, 0;
    else
        return 0, 0;
    end
end;

function onUseAbility(player,target,ability)
--formula from https://www.bg-wiki.com/bg/Cover
local baseDuration = 15;
local bonusTime = utils.clamp(math.floor((player:getMod(dsp.mod.VIT) + player:getMod(dsp.mod.MND) - target:getMod(dsp.mod.VIT) * 2) / 4), 0, 15)
local duration = baseDuration + bonusTime;

player:addStatusEffect(player,dsp.effect.COVER,0,0,duration)
  if player:physicalDmgTaken >= 0 then
    player.addMod(dsp.mod.Enmity, +200)
    target:lowerEnmity(target, 10)
  end
end
