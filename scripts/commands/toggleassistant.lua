---------------------------------------------------------------------------------------------------
-- func: @toggleassistant
-- auth: TeoTwawki
-- desc: Toggles a Assistant nameflags/icon (in retail, that icon is for trial accounts).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
    -- Removing any existing flags that might interfere.
    if (player:checkNameFlags(0x04000000)) then
        if (player:checkNameFlags(0x04000000)) then
            player:setFlag(0x04000000);
        end
        if (player:checkNameFlags(0x05000000)) then
            player:setFlag(0x05000000);
        end
        if (player:checkNameFlags(0x02000000)) then
            player:setFlag(0x02000000);
        end
        if (player:checkNameFlags(0x06000000)) then
            player:setFlag(0x06000000);
        end
    end
    if (player:checkNameFlags(0x00002000)) then
        player:setFlag(0x00002000);
        if (player:checkNameFlags(0x02000000)) then
            player:setFlag(0x02000000);
        end
    elseif (player:checkNameFlags(0x02000000)) then
        player:setFlag(0x02000000);
        if (player:checkNameFlags(0x00002000)) then
            player:setFlag(0x00002000);
        end
    -- Now making sure player is a designated assistant.
    elseif (player:getVar("AssistantGM") == 1) then
        -- And now setting our intended icon and name color.
        player:setFlag( 0x02002000 );
    end
end;