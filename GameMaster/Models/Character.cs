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
            SynergiesAgainstCharacterCharacterCharacter1s = new HashSet<SynergiesAgainstCharacterCharacter>();
            SynergiesAgainstCharacterCharacterCharacter2s = new HashSet<SynergiesAgainstCharacterCharacter>();
            SynergiesAgainstCharacterWeapons = new HashSet<SynergiesAgainstCharacterWeapon>();
            SynergiesWiths = new HashSet<SynergiesWith>();
            UsageAgainstCharacterCharacterCharacter1s = new HashSet<UsageAgainstCharacterCharacter>();
            UsageAgainstCharacterCharacterCharacter2s = new HashSet<UsageAgainstCharacterCharacter>();
            UsageAgainstCharacterWeapons = new HashSet<UsageAgainstCharacterWeapon>();
            UsageWiths = new HashSet<UsageWith>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int Strength { get; set; }
        public int Mobility { get; set; }
        public int Health { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<CharacterDetail> CharacterDetails { get; set; }
        public virtual ICollection<GamePlayer> GamePlayers { get; set; }
        public virtual ICollection<SynergiesAgainstCharacterCharacter> SynergiesAgainstCharacterCharacterCharacter1s { get; set; }
        public virtual ICollection<SynergiesAgainstCharacterCharacter> SynergiesAgainstCharacterCharacterCharacter2s { get; set; }
        public virtual ICollection<SynergiesAgainstCharacterWeapon> SynergiesAgainstCharacterWeapons { get; set; }
        public virtual ICollection<SynergiesWith> SynergiesWiths { get; set; }
        public virtual ICollection<UsageAgainstCharacterCharacter> UsageAgainstCharacterCharacterCharacter1s { get; set; }
        public virtual ICollection<UsageAgainstCharacterCharacter> UsageAgainstCharacterCharacterCharacter2s { get; set; }
        public virtual ICollection<UsageAgainstCharacterWeapon> UsageAgainstCharacterWeapons { get; set; }
        public virtual ICollection<UsageWith> UsageWiths { get; set; }
    }
}
