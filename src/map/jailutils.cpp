#include "jailutils.h"
#include "conquest_system.h"
#include "charentity.h"
namespace jailutils
{

bool InPrison(CCharEntity* PChar)
{
    if(!(PChar->nameflags.flags & FLAG_GM) &&
        PChar->getZone() == ZONE_MORDION_GAOL)
    {
        return true;
    }

    return false;
}

};