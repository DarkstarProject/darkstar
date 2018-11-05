-----------------------------------
-- Area: Port_San_dOria
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.PORT_SAN_DORIA] =
{
    text =
    {
        HOMEPOINT_SET                  = 24, -- Home point set!
        ITEM_CANNOT_BE_OBTAINED        = 6425, -- You cannot obtain the <item>. Come back after sorting your inventory.
        MYSTIC_RETRIEVER               = 6428, -- You cannot obtain the <item>. Speak with the mystic retriever after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE     = 6429, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED                  = 6431, -- Obtained: <item>.
        GIL_OBTAINED                   = 6432, -- Obtained <number> gil.
        KEYITEM_OBTAINED               = 6434, -- Obtained key item: <keyitem>.
        MOG_LOCKER_OFFSET              = 6595, -- Your Mog Locker lease is valid until <timestamp>, kupo.
        CONQUEST_BASE                  = 7065, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET         = 7224, -- You can't fish here.
        FLYER_REFUSED                  = 7556, -- This person isn't interested.
        FLYER_ALREADY                  = 7557, -- This person already has a flyer.
        FLYER_ACCEPTED                 = 7558, -- Your flyer is accepted!
        FLYERS_HANDED                  = 7559, -- You've handed out <number> flyer(s).
        PORTAURE_DIALOG                = 7823, -- What's this? A magic shop? Hmm...I could use a new line of work, and magic just might be the ticket!
        ANSWALD_DIALOG                 = 7843, -- A magic shop? Oh, it's right near here. I'll go check it out sometime.
        PRIETTA_DIALOG                 = 7867, -- This is the first I've heard of a magic shop here in San d'Oria. Such arts have never been popular in the Kingdom.
        AUVARE_DIALOG                  = 7874, -- What have I got here? Look, I can't read, but I takes what I gets, and you ain't getting it back!
        ALBINIE_SHOP_DIALOG            = 7887, -- Welcome to my simple shop.
        MIENE_DIALOG                   = 7927, -- Oh, a magic shop... Here in San d'Oria? I'd take a look if I got more allowance.
        COULLAVE_SHOP_DIALOG           = 7933, -- Can I help you?
        CROUMANGUE_SHOP_DIALOG         = 7934, -- Can't fight on an empty stomach. How about some nourishment?
        FIVA_OPEN_DIALOG               = 7935, -- I've got imports from Kolshushu!
        MILVA_OPEN_DIALOG              = 7936, -- How about some produce from Sarutabaruta?
        FIVA_CLOSED_DIALOG             = 7937, -- I'm trying to sell goods from Kolshushu. But I can't because we don't have enough influence there.
        MILVA_CLOSED_DIALOG            = 7938, -- I want to import produce from Sarutabaruta... But I can't do anything until we control that region!
        NIMIA_CLOSED_DIALOG            = 7939, -- I can't sell goods from the lowlands of Elshimo because it's under foreign control.
        PATOLLE_CLOSED_DIALOG          = 7940, -- I'm trying to find goods from Kuzotz. But how can I when it's under foreign control?
        VENDAVOQ_OPEN_DIALOG           = 7941, -- Vandoolin! Vendavoq vring voods vack vrom Vovalpolos! Vuy! Vuy!
        VENDAVOQ_CLOSED_DIALOG         = 7942, -- Vandoolin... Vendavoq's vream vo vell voods vrom vometown vf Vovalpolos...
        DEGUERENDARS_OPEN_DIALOG       = 7943, -- Welcome! Have a look at these rare goods from Tavnazia!
        DEGUERENDARS_CLOSED_DIALOG     = 7944, -- With that other nation in control of the region, there is no way for me to import goods from Tavnazia...
        DEGUERENDARS_COP_NOT_COMPLETED = 7945, -- <Sigh> Why must I wait for the Kingdom to issue a permit allowing me to set up shop? How am I to feed my children in the meantime!?
        ITEM_DELIVERY_DIALOG           = 7946, -- Now delivering parcels to rooms everywhere!
        GALLIJAUX_CARP_STATUS          = 8108, -- How's it going with you? I've got <number> [carp/carps] now--don't let me down!
        GALLIJAUX_HELP_OTHER_BROTHER   = 8111, -- What's this? You're helping me brother, are you? Be gone with you, then! Out of my sight!
        JOULET_CARP_STATUS             = 8120, -- How goes it? I've got a hold of <number> [carp/carps] now. Keep bringing them--I wouldn't want to lose to my brother!
        JOULET_HELP_OTHER_BROTHER      = 8123, -- Ah, so you've been helping my brother, have you!? Traitor! Turncoat! Be gone with you!
        BONMAURIEUT_CLOSED_DIALOG      = 8280, -- I would like to sell goods from the Elshimo Uplands, but I cannot, as it's under foreign control.
        NIMIA_OPEN_DIALOG              = 8281, -- Hello, friend! Can I interest you in specialty goods from the Elshimo Lowlands?
        PATOLLE_OPEN_DIALOG            = 8282, -- Hey, [mister/miss]! How about some specialty goods from Kuzotz?
        BONMAURIEUT_OPEN_DIALOG        = 8283, -- My shipment is in! Would you like to see what has just arrived from the Elshimo Uplands?
        ANSWALD_MESSAGE                = 8420, -- Answald looks over curiously for a moment.
        PRIETTA_MESSAGE                = 8421, -- Prietta looks over curiously for a moment.
        MIENE_MESSAGE                  = 8422, -- Miene looks over curiously for a moment.
        PORTAURE_MESSAGE               = 8423, -- Portaure looks over curiously for a moment.
        AUVARE_MESSAGE                 = 8424, -- Auvare looks over curiously for a moment.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.PORT_SAN_DORIA]