---------------------------------------------------------------------------------------------------
-- func: @grats
-- auth: TeoTwawki
-- desc: triggers the congratulation animation normally seen on fireworks
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
	player:injectActionPacket(5, 107);
end;