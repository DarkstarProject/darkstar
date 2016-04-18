/*
===========================================================================

Copyright (c) 2010-2015 Darkstar Dev Teams

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see http://www.gnu.org/licenses/

This file is part of DarkStar-server source code.

===========================================================================
*/

#include <mutex>
#include <queue>

#include "message.h"

#include "party.h"
#include "alliance.h"
#include "linkshell.h"
#include "status_effect_container.h"

#include "entities/charentity.h"

#include "packets/message_standard.h"
#include "packets/party_invite.h"
#include "packets/server_ip.h"

#include "utils/zoneutils.h"
#include "utils/jailutils.h"
#include "items/item_linkshell.h"

namespace message
{
    zmq::context_t zContext;
    zmq::socket_t* zSocket = nullptr;
    std::mutex send_mutex;
    std::queue<chat_message_t> message_queue;

    void send_queue()
    {
        while (!message_queue.empty())
        {
            std::lock_guard<std::mutex> lk(send_mutex);
            chat_message_t msg = message_queue.front();
            message_queue.pop();
            try
            {
                zSocket->send(*msg.type, ZMQ_SNDMORE);
                zSocket->send(*msg.data, ZMQ_SNDMORE);
                zSocket->send(*msg.packet);
            }
            catch (std::exception& e)
            {
                ShowError("Message: %s", e.what());
            }
        }
    }

    void parse(MSGSERVTYPE type, zmq::message_t* extra, zmq::message_t* packet)
    {
        ShowDebug("Message: Received message %d from message server\n", type);
        switch (type)
        {
        case MSG_LOGIN:
        {
            CCharEntity* PChar = zoneutils::GetChar(RBUFL(extra->data(), 0));

            if (!PChar)
            {
                Sql_Query(SqlHandle, "DELETE FROM accounts_sessions WHERE charid = %d;", RBUFL(extra->data(), 0));
            }
            else
            {
                //TODO: disconnect the client, but leave the character in the disconnecting state
                //PChar->status = STATUS_SHUTDOWN;
                //won't save their position (since this is the wrong thread) but not a huge deal
                //PChar->pushPacket(new CServerIPPacket(PChar, 1, 0));
            }
            break;
        }
        case MSG_CHAT_TELL:
        {
            CCharEntity* PChar = zoneutils::GetCharByName((int8*)extra->data() + 4);
            if (PChar && PChar->status != STATUS_DISAPPEAR && !jailutils::InPrison(PChar))
            {
                if (PChar->nameflags.flags & FLAG_AWAY)
                {
                    send(MSG_DIRECT, extra->data(), sizeof(uint32), new CMessageStandardPacket(PChar, 0, 0, 181));
                }
                else
                {
                    CBasicPacket* newPacket = new CBasicPacket();
                    memcpy(*newPacket, packet->data(), dsp_min(packet->size(), PACKET_SIZE));
                    PChar->pushPacket(newPacket);
                }
            }
            else
            {
                send(MSG_DIRECT, extra->data(), sizeof(uint32), new CMessageStandardPacket(PChar, 0, 0, 125));
            }
            break;
        }
        case MSG_CHAT_PARTY:
        {
            CCharEntity* PChar = zoneutils::GetChar(RBUFL(extra->data(), 0));
            if (PChar)
            {
                if (PChar->PParty)
                {
                    if (PChar->PParty->m_PAlliance != nullptr)
                    {
                        for (uint8 i = 0; i < PChar->PParty->m_PAlliance->partyList.size(); ++i)
                        {
                            CBasicPacket* newPacket = new CBasicPacket();
                            memcpy(*newPacket, packet->data(), dsp_min(packet->size(), PACKET_SIZE));
                            ((CParty*)PChar->PParty->m_PAlliance->partyList.at(i))->PushPacket(RBUFL(extra->data(), 4), 0, newPacket);
                        }
                    }
                    else
                    {
                        CBasicPacket* newPacket = new CBasicPacket();
                        memcpy(*newPacket, packet->data(), dsp_min(packet->size(), PACKET_SIZE));
                        PChar->PParty->PushPacket(RBUFL(extra->data(), 4), 0, newPacket);
                    }
                }
            }
            break;
        }
        case MSG_CHAT_LINKSHELL:
        {
            uint32 linkshellID = RBUFL(extra->data(), 0);
            CLinkshell* PLinkshell = linkshell::GetLinkshell(linkshellID);
            if (PLinkshell)
            {
                CBasicPacket* newPacket = new CBasicPacket();
                memcpy(*newPacket, packet->data(), dsp_min(packet->size(), PACKET_SIZE));
                PLinkshell->PushPacket(RBUFL(extra->data(), 4), newPacket);
            }
            break;
        }
        case MSG_CHAT_YELL:
        {
            zoneutils::ForEachZone([&packet, &extra](CZone* PZone)
            {
                if (PZone->CanUseMisc(MISC_YELL))
                {
                    PZone->ForEachChar([&packet, &extra](CCharEntity* PChar)
                    {
                        // don't push to sender
                        if (PChar->id != RBUFL(extra->data(), 0))
                        {
                            CBasicPacket* newPacket = new CBasicPacket();
                            memcpy(*newPacket, packet->data(), dsp_min(packet->size(), PACKET_SIZE));

                            PChar->pushPacket(newPacket);
                        }
                    });
                }
            });
            break;
        }
        case MSG_CHAT_SERVMES:
        {
            zoneutils::ForEachZone([&packet](CZone* PZone)
            {
                PZone->ForEachChar([&packet](CCharEntity* PChar)
                {
                    CBasicPacket* newPacket = new CBasicPacket();
                    memcpy(*newPacket, packet->data(), dsp_min(packet->size(), PACKET_SIZE));
                    PChar->pushPacket(newPacket);
                });
            });
            break;
        }
        case MSG_PT_INVITE:
        {
            uint32 id = RBUFL(extra->data(), 0);
            uint16 targid = RBUFW(extra->data(), 4);
            uint8 inviteType = RBUFB(packet->data(), 0x0B);
            CCharEntity* PInvitee = zoneutils::GetChar(id);

            if (PInvitee)
            {
                //make sure invitee isn't dead or in jail, they aren't a party member and don't already have an invite pending, and your party is not full
                if (PInvitee->isDead() || jailutils::InPrison(PInvitee) || PInvitee->InvitePending.id != 0 || (PInvitee->PParty && inviteType == INVITE_PARTY) ||
                    (inviteType == INVITE_ALLIANCE && (!PInvitee->PParty || PInvitee->PParty->GetLeader() != PInvitee || PInvitee->PParty->m_PAlliance)))
                {
                    WBUFL(extra->data(), 0) = RBUFL(extra->data(), 6);
                    send(MSG_DIRECT, extra->data(), sizeof(uint32), new CMessageStandardPacket(PInvitee, 0, 0, 23));
                    return;
                }
                if (PInvitee->StatusEffectContainer->HasStatusEffect(EFFECT_LEVEL_SYNC))
                {
                    WBUFL(extra->data(), 0) = RBUFL(extra->data(), 6);
                    send(MSG_DIRECT, extra->data(), sizeof(uint32), new CMessageStandardPacket(PInvitee, 0, 0, 236));
                    return;
                }

                PInvitee->InvitePending.id = RBUFL(extra->data(), 6);
                PInvitee->InvitePending.targid = RBUFW(extra->data(), 10);
                CBasicPacket* newPacket = new CBasicPacket();
                memcpy(*newPacket, packet->data(), dsp_min(packet->size(), PACKET_SIZE));
                PInvitee->pushPacket(newPacket);
            }
            break;
        }
        case MSG_PT_INV_RES:
        {
            uint32 inviterId = RBUFL(extra->data(), 0);
            uint16 inviterTargid = RBUFW(extra->data(), 4);
            uint32 inviteeId = RBUFL(extra->data(), 6);
            uint16 inviteeTargid = RBUFW(extra->data(), 10);
            uint8 inviteAnswer = RBUFB(extra->data(), 12);
            CCharEntity* PInviter = zoneutils::GetChar(inviterId);

            if (PInviter)
            {
                if (inviteAnswer == 0)
                {
                    PInviter->pushPacket(new CMessageStandardPacket(PInviter, 0, 0, 11));
                }
                else
                {
                    //both party leaders?
                    int ret = Sql_Query(SqlHandle, "SELECT * FROM accounts_parties WHERE partyid <> 0 AND \
                                                   													   	((charid = %u OR charid = %u) AND partyflag & %u);", inviterId,
                                                                                                        inviteeId, PARTY_LEADER);
                    if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) == 2)
                    {
                        if (PInviter->PParty->m_PAlliance)
                        {
                            ret = Sql_Query(SqlHandle, "SELECT * FROM accounts_parties WHERE allianceid <> 0 AND \
                                                       														   	allianceid = (SELECT allianceid FROM accounts_parties where \
                                                                                                                															charid = %u) GROUP BY partyid;", inviterId);
                            if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) > 0 && Sql_NumRows(SqlHandle) < 3)
                            {
                                PInviter->PParty->m_PAlliance->addParty(inviteeId);
                            }
                            else
                            {
                                send(MSG_DIRECT, (uint8*)extra->data() + 6, sizeof(uint32), new CMessageStandardPacket(PInviter, 0, 0, 14));
                            }
                        }
                        else
                        {
                            //make new alliance
                            CAlliance* PAlliance = new CAlliance(PInviter);
                            PAlliance->addParty(inviteeId);
                        }
                    }
                    else
                    {
                        if (PInviter->PParty == nullptr)
                        {
                            CParty* PParty = new CParty(PInviter);
                        }
                        if (PInviter->PParty->GetLeader() == PInviter)
                        {
                            ret = Sql_Query(SqlHandle, "SELECT * FROM accounts_parties WHERE partyid <> 0 AND \
                                                       															charid = %u;", inviteeId);
                            if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) == 0)
                            {
                                PInviter->PParty->AddMember(inviteeId);
                            }
                        }
                    }
                }
            }
            break;
        }
        case MSG_PT_RELOAD:
        {
            CCharEntity* PChar = zoneutils::GetChar(RBUFL(extra->data(), 0));
            if (PChar)
            {
                PChar->ForAlliance([](CBattleEntity* PMember)
                {
                    ((CCharEntity*)PMember)->ReloadPartyInc();
                });
            }
            break;
        }
        case MSG_PT_DISBAND:
        {
            CCharEntity* PChar = zoneutils::GetChar(RBUFL(extra->data(), 0));
            uint32 id = RBUFL(extra->data(), 4);
            if (PChar)
            {
                if (PChar->PParty)
                {
                    if (PChar->PParty->m_PAlliance && PChar->PParty->m_PAlliance->m_AllianceID == id)
                    {
                        PChar->PParty->m_PAlliance->dissolveAlliance(false);
                    }
                    else
                    {
                        PChar->PParty->DisbandParty(false);
                    }
                }
            }
            break;
        }
        case MSG_DIRECT:
        {
            CCharEntity* PChar = zoneutils::GetChar(RBUFL(extra->data(), 0));
            if (PChar)
            {
                CBasicPacket* newPacket = new CBasicPacket();
                memcpy(*newPacket, packet->data(), dsp_min(packet->size(), PACKET_SIZE));
                PChar->pushPacket(newPacket);
            }
            break;
        }
        case MSG_LINKSHELL_RANK_CHANGE:
        {
            CLinkshell* PLinkshell = linkshell::GetLinkshell(RBUFL(extra->data(), 24));

            if (PLinkshell)
            {
                PLinkshell->ChangeMemberRank((int8*)extra->data() + 4, RBUFB(extra->data(), 28));
            }
            break;
        }
        case MSG_LINKSHELL_REMOVE:
        {
            CCharEntity* PChar = zoneutils::GetCharByName((int8*)extra->data() + 4);

            if (PChar && PChar->PLinkshell1 && PChar->PLinkshell1->getID() == RBUFL(extra->data(), 24))
            {
                uint8 kickerRank = RBUFB(extra->data(), 28);
                CItemLinkshell* targetLS = (CItemLinkshell*)PChar->getEquip(SLOT_LINK1);
                if (kickerRank == LSTYPE_LINKSHELL || (kickerRank == LSTYPE_PEARLSACK && targetLS && targetLS->GetLSType() == LSTYPE_LINKPEARL))
                {
                    PChar->PLinkshell1->RemoveMemberByName((int8*)extra->data() + 4);
                }
            }
            break;
        }
        default:
        {
            ShowWarning("Message: unhandled message type %d\n", type);
        }
        }
    }

    void listen()
    {
        while (true)
        {
            zmq::message_t type;
            zmq::message_t extra;
            zmq::message_t packet;

            try
            {
                if (!zSocket)
                {
                    return;
                }
                if (!zSocket->recv(&type))
                {
                    if (!message_queue.empty())
                        send_queue();
                    continue;
                }

                int more;
                size_t size = sizeof(more);
                zSocket->getsockopt(ZMQ_RCVMORE, &more, &size);
                if (more)
                {
                    zSocket->recv(&extra);
                    zSocket->getsockopt(ZMQ_RCVMORE, &more, &size);
                    if (more)
                    {
                        zSocket->recv(&packet);
                    }
                }
            }
            catch (zmq::error_t e)
            {
                if (!zSocket)
                {
                    return;
                }
                ShowError("Message: %s\n", e.what());
                continue;
            }

            parse((MSGSERVTYPE)RBUFB(type.data(), 0), &extra, &packet);
        }
    }

    void init(const char* chatIp, uint16 chatPort)
    {
        SqlHandle = Sql_Malloc();

        if (Sql_Connect(SqlHandle, map_config.mysql_login,
            map_config.mysql_password,
            map_config.mysql_host,
            map_config.mysql_port,
            map_config.mysql_database) == SQL_ERROR)
        {
            exit(EXIT_FAILURE);
        }
        Sql_Keepalive(SqlHandle);

        zContext = zmq::context_t(1);
        zSocket = new zmq::socket_t(zContext, ZMQ_DEALER);

        uint64 ipp = map_ip.s_addr;
        uint64 port = map_port;

        //if no ip/port were supplied, set to 1 (0 is not valid for an identity)
        if (map_ip.s_addr == 0 && map_port == 0)
        {
            int ret = Sql_Query(SqlHandle, "SELECT zoneip, zoneport FROM zone_settings GROUP BY zoneip, zoneport ORDER BY COUNT(*) DESC;");
            if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) > 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                ipp = inet_addr(Sql_GetData(SqlHandle, 0));
                port = Sql_GetUIntData(SqlHandle, 1);
            }
        }
        ipp |= (port << 32);

        zSocket->setsockopt(ZMQ_IDENTITY, &ipp, sizeof ipp);

        uint32 to = 500;
        zSocket->setsockopt(ZMQ_RCVTIMEO, &to, sizeof to);

        string_t server = "tcp://";
        server.append(chatIp);
        server.append(":");
        server.append(std::to_string(chatPort));

        try
        {
            zSocket->connect(server.c_str());
        }
        catch (zmq::error_t err)
        {
            ShowFatalError("Message: Unable to connect chat socket: %s\n", err.what());
        }

        listen();
    }

    void close()
    {
        if (zSocket)
        {
            zSocket->close();
            delete zSocket;
            zSocket = nullptr;
        }
        zContext.close();
    }

    void send(MSGSERVTYPE type, void* data, size_t datalen, CBasicPacket* packet)
    {
        std::lock_guard<std::mutex> lk(send_mutex);
        chat_message_t msg;
        msg.type = new zmq::message_t(sizeof(MSGSERVTYPE));
        WBUFB(msg.type->data(), 0) = type;

        msg.data = new zmq::message_t(datalen);
        if (datalen > 0)
            memcpy(msg.data->data(), data, datalen);

        if (packet)
        {
            msg.packet = new zmq::message_t(*packet, packet->length(), [](void *data, void *hint) {delete[](uint8*) data; });
        }
        else
        {
            msg.packet = new zmq::message_t(0);
        }
        message_queue.push(msg);
    }
};
