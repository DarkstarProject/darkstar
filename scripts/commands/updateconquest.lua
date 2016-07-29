---------------------------------------------------------------------------------------------------
-- func: updateconquest
-- desc: Updates all conquest guard. (Need modify in db first.)
---------------------------------------------------------------------------------------------------

require("scripts/globals/conquest");

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, updatetype)
    WeekUpdateConquest(updatetype);
end