   cmdprops =
{
    permission = 0,
    parameters = "iiii"
};


function onTrigger(player) -- 

  charalevel = player:getMainLvl();
 
  if(charalevel <= 74) then
  {
    player:delStatusEffect(EFFECT_REGAIN);
    player:delStatusEffect(EFFECT_REFRESH);
    player:delStatusEffect(EFFECT_REGEN);
    player:addStatusEffect(EFFECT_REGAIN,10,8,1800);
    player:addStatusEffect(EFFECT_REFRESH,10,7,1800);
    player:addStatusEffect(EFFECT_REGEN,10,7,1800);
   } else
     player:PrintToPlayer('Only for jobs below level 75');
   
   end
end 
