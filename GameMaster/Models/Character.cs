using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class Character
    {
        public Character()
        {
            CharacterDetails = new HashSet<CharacterDetail>();
            GamePlayers = new HashSet<GamePlayer>();
            SynergiesCharacterCharacterCharacter1s = new HashSet<SynergiesCharacterCharacter>();
            SynergiesCharacterCharacterCharacter2s = new HashSet<SynergiesCharacterCharacter>();
            SynergiesCharacterWeapons = new HashSet<SynergiesCharacterWeapon>();
            UsageAgainstCharacterCharacterCharacter1s = new HashSet<UsageAgainstCharacterCharacter>();
            UsageAgainstCharacterCharacterCharacter2s = new HashSet<UsageAgainstCharacterCharacter>();
            UsageAgainstCharacterWeapons = new HashSet<UsageAgainstCharacterWeapon>();
            UsageWiths = new HashSet<UsageWith>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int Health { get; set; }
        public int Mobility { get; set; }
        public int Strength { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<CharacterDetail> CharacterDetails { get; set; }
        public virtual ICollection<GamePlayer> GamePlayers { get; set; }
        public virtual ICollection<SynergiesCharacterCharacter> SynergiesCharacterCharacterCharacter1s { get; set; }
        public virtual ICollection<SynergiesCharacterCharacter> SynergiesCharacterCharacterCharacter2s { get; set; }
        public virtual ICollection<SynergiesCharacterWeapon> SynergiesCharacterWeapons { get; set; }
        public virtual ICollection<UsageAgainstCharacterCharacter> UsageAgainstCharacterCharacterCharacter1s { get; set; }
        public virtual ICollection<UsageAgainstCharacterCharacter> UsageAgainstCharacterCharacterCharacter2s { get; set; }
        public virtual ICollection<UsageAgainstCharacterWeapon> UsageAgainstCharacterWeapons { get; set; }
        public virtual ICollection<UsageWith> UsageWiths { get; set; }
    }
}
