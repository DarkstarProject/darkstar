---------------------------------------------------------------------------------------------------
-- func: Give's player Chocobo Effect.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};


function onTrigger(player)
	 player:setAnimation("5");
	 player:messagePublic(280, player, EFFECT_CHOCOBO, EFFECT_CHOCOBO);
end;