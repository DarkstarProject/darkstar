---------------------------------------------------------------------------------------------------
-- func: @ah
-- auth: TeoTwawki, Tagban, probably others independently as well.
-- desc: opens the Auction House menu anywhere in the world just to see if we can
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player,npc)
    player:sendMenu(3);
end;