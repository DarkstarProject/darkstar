---------------------------------------------------------------------------------------------------
-- func: timeoffset
-- desc: Sets the custom time offset of the CVanaTime instance.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = "i"
};

function onTrigger(player, offset)
    SetVanadielTimeOffset( offset );
end