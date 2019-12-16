-----------------------------------
-- Area: Port_Jeuno
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.PORT_JEUNO] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        KEYITEM_LOST            = 6392, -- Lost key item: <keyitem>.
        CONQUEST_BASE           = 6477, -- Tallying conquest results...
        HOMEPOINT_SET           = 6638, -- Home point set!
        MOG_LOCKER_OFFSET       = 6751, -- Your Mog Locker lease is valid until <timestamp>, kupo.
        WEATHER_DIALOG          = 6849, -- Your fate rides on the changing winds of Vana'diel. I can give you insight on the local weather.
        FISHING_MESSAGE_OFFSET  = 6897, -- You can't fish here.
        GUIDE_STONE             = 7013, -- Up: Lower Jeuno (facing Bastok) Down: Qufim Island
        LEYLA_SHOP_DIALOG       = 7014, -- Hello. All goods are duty-free.
        GEKKO_SHOP_DIALOG       = 7014, -- Hello. All goods are duty-free.
        CHALLOUX_SHOP_DIALOG    = 7015, -- Good day!
        CUMETOUFLAIX_DIALOG     = 7053, -- This underground tunnel leads to the island of Qufim. Everyone is advised to stay out. But of course you adventurers never listen.
        COUNTER_NPC_2           = 7059, -- With the airships connecting Jeuno with the three nations, the flow of goods has become much more consistent. Nowadays, everything comes through Jeuno!
        COUNTER_NPC             = 7061, -- I think the airships are a subtle form of pressure on the other three nations. That way, Jeuno can maintain the current balance of power.
        ARRIVAL_NPC             = 7071, -- Enjoy your stay in Jeuno!
        DAPOL_DIALOG            = 7084, -- Welcome to Port Jeuno, the busiest airship hub anywhere! You can't miss the awe-inspiring view of airships in flight!
        SECURITY_DIALOG         = 7087, -- Port Jeuno must remain secure. After all, if anything happened to the archduke, it would change the world!
        MOGHOUSE_EXIT           = 7168, -- You have learned your way through the back alleys of Jeuno! Now you can exit to any area from your residence.
        CHOCOBO_DIALOG          = 7190, -- ...
        OLD_BOX                 = 7288, -- You find a grimy old box.
        GAVIN_DIALOG            = 7359, -- This is the counter for the air route to the Outlands. Our airships connect Jeuno with the southeastern island of Elshimo.
        TSOLAG_DIALOG           = 7377, -- This is the departure gate for airship passengers. If you have any questions, please inquire with Guddal.
        VEUJAIE_DIALOG          = 7378, -- Delivering goods to residences everywhere!
        DIGAGA_DIALOG           = 7378, -- Delivering goods to residences everywhere!
        ITEM_DELIVERY_DIALOG    = 7378, -- Delivering goods to residences everywhere!
        CONQUEST                = 7388, -- You've earned conquest points!
        SAGHEERA_MAX_ABCS       = 8029, -- I apologize, but I cannot take any more <item> from you.
        SAGHEERA_LACK_ABCS      = 8030, -- You have collected the proper materials, but unfortunately you lack the required amount of <item> for payment.
        GET_LOST                = 8153, -- You want somethin' from me? Well, too bad. I don't want nothin' from you. Get lost.
        DRYEYES_1               = 8162, -- Then why you waste my time? Get lost.
        DRYEYES_2               = 8163, -- Done deal. Deal is done. You a real sucker--<cough>--I mean, good customer. Come back soon. And don't forget the goods.
        DRYEYES_3               = 8164, -- Hey, you already got <item>. What you tryin' to pull here? Save some for my other customers, eh?
        CHEST_IS_EMPTY          = 8652, -- The chest is empty.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.PORT_JEUNO]