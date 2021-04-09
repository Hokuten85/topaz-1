#ifndef _ITRUSTUTILS_H
#define _ITRUSTUTILS_H

#include "../../common/cbasetypes.h"
#include "../../common/mmo.h"
#include "../entities/battleentity.h"
#include "../spell.h"
#include <vector>

class CBattleEntity;
class CCharEntity;
class CTrustEntity;
class CItemEquipment;

struct TrustSpell_ID
{
    uint32 spellID;
};

struct SongPriority_t
{
    SPELLFAMILY spell_family;
    uint8       spell_count;
};

struct Trust_t
{
    uint32    trustID;
    look_t    look;        // appearance data
    string_t  name;        // script name string
    string_t  packet_name; // packet name string
    ECOSYSTEM EcoSystem;   // ecosystem

    uint8  name_prefix;
    uint8  size; // размер модели
    uint16 m_Family;

    uint16 behaviour;

    uint8 mJob;
    uint8 sJob;
    float HPscale; // HP boost percentage
    float MPscale; // MP boost percentage

    uint8  cmbSkill;
    uint16 cmbDmgMult;
    uint16 cmbDelay;
    uint8  speed;
    // stat ranks
    uint8 strRank;
    uint8 dexRank;
    uint8 vitRank;
    uint8 agiRank;
    uint8 intRank;
    uint8 mndRank;
    uint8 chrRank;
    uint8 attRank;
    uint8 defRank;
    uint8 evaRank;
    uint8 accRank;

    uint16 m_MobSkillList;

    // magic stuff
    bool   hasSpellScript;
    uint16 spellList;

    // resists
    int16 slashres;
    int16 pierceres;
    int16 hthres;
    int16 impactres;

    int16 firedef;
    int16 icedef;
    int16 winddef;
    int16 earthdef;
    int16 thunderdef;
    int16 waterdef;
    int16 lightdef;
    int16 darkdef;

    int16 fireres;
    int16 iceres;
    int16 windres;
    int16 earthres;
    int16 thunderres;
    int16 waterres;
    int16 lightres;
    int16 darkres;
};

namespace trustutils
{
    void LoadTrustList();
    void FreeTrustList();

    void SpawnTrust(CCharEntity* PMaster, uint32 TrustID);

    // Internal
    void          BuildTrust(uint32 TrustID);
    CTrustEntity* LoadTrust(CCharEntity* PMaster, uint32 TrustID);
    void          LoadTrustStatsAndSkills(CTrustEntity* PTrust);
    void          LoadTrustEquipment(CTrustEntity* PTrust, CCharEntity* PMaster);
    void          SetBrdSongPiority(CTrustEntity* PTrust);
    void          SetSongList(CTrustEntity* PTrust, const std::vector<SongPriority_t>& songPriorities, std::vector<SpellID>& songList);

    void  BuildingTrustAbilityTable(CTrustEntity* PTrust);
    int32 hasAbility(CTrustEntity* PTrust, uint16 AbilityID); // проверяем наличие ключевого предмета
    int32 addAbility(CTrustEntity* PTrust, uint16 AbilityID); // добавляем ключевой предмет
}; // namespace trustutils

#endif
