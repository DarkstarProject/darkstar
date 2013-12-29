---------------------------------------------------------------------------------------------------
-- func: updateconquest
-- auth: Ezekyel
-- desc: Updates all conquest guard. (Need modify in db first.)
---------------------------------------------------------------------------------------------------

require("scripts/globals/conquest");

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    WeekUpdateConquest();
end