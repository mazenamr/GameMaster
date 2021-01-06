using System;
using System.IO;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace GameMaster.Models
{
    public partial class GameMasterContext : DbContext
    {
        public GameMasterContext()
        {
        }

        public GameMasterContext(DbContextOptions<GameMasterContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Character> Characters { get; set; }
        public virtual DbSet<CharacterDetail> CharacterDetails { get; set; }
        public virtual DbSet<Game> Games { get; set; }
        public virtual DbSet<Person> People { get; set; }
        public virtual DbSet<Player> Players { get; set; }
        public virtual DbSet<Rank> Ranks { get; set; }
        public virtual DbSet<Region> Regions { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Season> Seasons { get; set; }
        public virtual DbSet<SynergiesAgainstCharacterCharacter> SynergiesAgainstCharacterCharacters { get; set; }
        public virtual DbSet<SynergiesAgainstCharacterWeapon> SynergiesAgainstCharacterWeapons { get; set; }
        public virtual DbSet<SynergiesAgainstWeaponWeapon> SynergiesAgainstWeaponWeapons { get; set; }
        public virtual DbSet<SynergiesWith> SynergiesWiths { get; set; }
        public virtual DbSet<UsageAgainstCharacterCharacter> UsageAgainstCharacterCharacters { get; set; }
        public virtual DbSet<UsageAgainstCharacterWeapon> UsageAgainstCharacterWeapons { get; set; }
        public virtual DbSet<UsageAgainstWeaponWeapon> UsageAgainstWeaponWeapons { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<VersionInfo> VersionInfos { get; set; }
        public virtual DbSet<Weapon> Weapons { get; set; }
        public virtual DbSet<WeaponDetail> WeaponDetails { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Character>(entity =>
            {
                entity.ToTable("Character");

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<CharacterDetail>(entity =>
            {
                entity.HasIndex(e => e.CharacterId, "IX_CharacterDetails_CharacterId");

                entity.HasIndex(e => e.SeasonId, "IX_CharacterDetails_SeasonId");

                entity.HasOne(d => d.Character)
                    .WithMany(p => p.CharacterDetails)
                    .HasForeignKey(d => d.CharacterId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CharacterDetails_CharacterId_Character_id");

                entity.HasOne(d => d.Season)
                    .WithMany(p => p.CharacterDetails)
                    .HasForeignKey(d => d.SeasonId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CharacterDetails_SeasonId_Season_id");
            });

            modelBuilder.Entity<Game>(entity =>
            {
                entity.ToTable("Game");

                entity.HasIndex(e => e.Character1Id, "IX_Game_Character1Id");

                entity.HasIndex(e => e.Character2Id, "IX_Game_Character2Id");

                entity.HasIndex(e => e.GamewinnerId, "IX_Game_GamewinnerId");

                entity.HasIndex(e => e.Player1Id, "IX_Game_Player1Id");

                entity.HasIndex(e => e.Player2Id, "IX_Game_Player2Id");

                entity.HasIndex(e => e.SeasonId, "IX_Game_SeasonId");

                entity.HasIndex(e => e.Weapon1Id, "IX_Game_Weapon1Id");

                entity.HasIndex(e => e.Weapon2Id, "IX_Game_Weapon2Id");

                entity.HasOne(d => d.Character1)
                    .WithMany(p => p.GameCharacter1s)
                    .HasForeignKey(d => d.Character1Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Game_Character1Id_Character_id");

                entity.HasOne(d => d.Character2)
                    .WithMany(p => p.GameCharacter2s)
                    .HasForeignKey(d => d.Character2Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Game_Character2Id_Character_id");

                entity.HasOne(d => d.Gamewinner)
                    .WithMany(p => p.GameGamewinners)
                    .HasForeignKey(d => d.GamewinnerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Game_GamewinnerId_Player_id");

                entity.HasOne(d => d.Player1)
                    .WithMany(p => p.GamePlayer1s)
                    .HasForeignKey(d => d.Player1Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Game_Player1Id_Player_id");

                entity.HasOne(d => d.Player2)
                    .WithMany(p => p.GamePlayer2s)
                    .HasForeignKey(d => d.Player2Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Game_Player2Id_Player_id");

                entity.HasOne(d => d.Season)
                    .WithMany(p => p.Games)
                    .HasForeignKey(d => d.SeasonId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Game_SeasonId_Season_id");

                entity.HasOne(d => d.Weapon1)
                    .WithMany(p => p.GameWeapon1s)
                    .HasForeignKey(d => d.Weapon1Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Game_Weapon1Id_Weapon_id");

                entity.HasOne(d => d.Weapon2)
                    .WithMany(p => p.GameWeapon2s)
                    .HasForeignKey(d => d.Weapon2Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Game_Weapon2Id_Weapon_id");
            });

            modelBuilder.Entity<Person>(entity =>
            {
                entity.ToTable("Person");

                entity.Property(e => e.Birthday).HasColumnType("date");

                entity.Property(e => e.DateCreated).HasColumnType("date");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Player>(entity =>
            {
                entity.ToTable("Player");

                entity.HasIndex(e => e.PersonId, "IX_Player_PersonId");

                entity.HasIndex(e => e.RankId, "IX_Player_RankId");

                entity.HasIndex(e => e.RegionId, "IX_Player_RegionId");

                entity.Property(e => e.DateCreated).HasColumnType("date");

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.HasOne(d => d.Person)
                    .WithMany(p => p.Players)
                    .HasForeignKey(d => d.PersonId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Player_PersonId_Person_id");

                entity.HasOne(d => d.Rank)
                    .WithMany(p => p.Players)
                    .HasForeignKey(d => d.RankId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Player_RankId_Rank_id");

                entity.HasOne(d => d.Region)
                    .WithMany(p => p.Players)
                    .HasForeignKey(d => d.RegionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Player_RegionId_Region_id");
            });

            modelBuilder.Entity<Rank>(entity =>
            {
                entity.ToTable("Rank");

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Region>(entity =>
            {
                entity.ToTable("Region");

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(20);
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role");

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Season>(entity =>
            {
                entity.ToTable("Season");

                entity.Property(e => e.EndDate).HasColumnType("date");

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.StartDate).HasColumnType("date");
            });

            modelBuilder.Entity<SynergiesAgainstCharacterCharacter>(entity =>
            {
                entity.ToTable("SynergiesAgainstCharacterCharacter");

                entity.HasIndex(e => e.Character1Id, "IX_SynergiesAgainstCharacterCharacter_Character1Id");

                entity.HasIndex(e => e.Character2Id, "IX_SynergiesAgainstCharacterCharacter_Character2Id");

                entity.HasOne(d => d.Character1)
                    .WithMany(p => p.SynergiesAgainstCharacterCharacterCharacter1s)
                    .HasForeignKey(d => d.Character1Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SynergiesAgainstCharacterCharacter_Character1Id_Character_id");

                entity.HasOne(d => d.Character2)
                    .WithMany(p => p.SynergiesAgainstCharacterCharacterCharacter2s)
                    .HasForeignKey(d => d.Character2Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SynergiesAgainstCharacterCharacter_Character2Id_Character_id");
            });

            modelBuilder.Entity<SynergiesAgainstCharacterWeapon>(entity =>
            {
                entity.ToTable("SynergiesAgainstCharacterWeapon");

                entity.HasIndex(e => e.CharacterId, "IX_SynergiesAgainstCharacterWeapon_CharacterId");

                entity.HasIndex(e => e.WeaponId, "IX_SynergiesAgainstCharacterWeapon_WeaponId");

                entity.HasOne(d => d.Character)
                    .WithMany(p => p.SynergiesAgainstCharacterWeapons)
                    .HasForeignKey(d => d.CharacterId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SynergiesAgainstCharacterWeapon_CharacterId_Character_id");

                entity.HasOne(d => d.Weapon)
                    .WithMany(p => p.SynergiesAgainstCharacterWeapons)
                    .HasForeignKey(d => d.WeaponId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SynergiesAgainstCharacterWeapon_WeaponId_Weapon_id");
            });

            modelBuilder.Entity<SynergiesAgainstWeaponWeapon>(entity =>
            {
                entity.ToTable("SynergiesAgainstWeaponWeapon");

                entity.HasIndex(e => e.Weapon1Id, "IX_SynergiesAgainstWeaponWeapon_Weapon1Id");

                entity.HasIndex(e => e.Weapon2Id, "IX_SynergiesAgainstWeaponWeapon_Weapon2_id");

                entity.Property(e => e.Weapon2Id).HasColumnName("Weapon2_id");

                entity.HasOne(d => d.Weapon1)
                    .WithMany(p => p.SynergiesAgainstWeaponWeaponWeapon1s)
                    .HasForeignKey(d => d.Weapon1Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SynergiesAgainstWeaponWeapon_Weapon1Id_Weapon_id");

                entity.HasOne(d => d.Weapon2)
                    .WithMany(p => p.SynergiesAgainstWeaponWeaponWeapon2s)
                    .HasForeignKey(d => d.Weapon2Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SynergiesAgainstWeaponWeapon_Weapon2_id_Weapon_id");
            });

            modelBuilder.Entity<SynergiesWith>(entity =>
            {
                entity.ToTable("SynergiesWith");

                entity.HasIndex(e => e.CharacterId, "IX_SynergiesWith_CharacterId");

                entity.HasIndex(e => e.WeaponId, "IX_SynergiesWith_WeaponId");

                entity.HasOne(d => d.Character)
                    .WithMany(p => p.SynergiesWiths)
                    .HasForeignKey(d => d.CharacterId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SynergiesWith_CharacterId_Character_id");

                entity.HasOne(d => d.Weapon)
                    .WithMany(p => p.SynergiesWiths)
                    .HasForeignKey(d => d.WeaponId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SynergiesWith_WeaponId_Weapon_id");
            });

            modelBuilder.Entity<UsageAgainstCharacterCharacter>(entity =>
            {
                entity.ToTable("UsageAgainstCharacterCharacter");

                entity.HasIndex(e => e.Character1Id, "IX_UsageAgainstCharacterCharacter_Character1Id");

                entity.HasIndex(e => e.Character2Id, "IX_UsageAgainstCharacterCharacter_Character2Id");

                entity.HasOne(d => d.Character1)
                    .WithMany(p => p.UsageAgainstCharacterCharacterCharacter1s)
                    .HasForeignKey(d => d.Character1Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UsageAgainstCharacterCharacter_Character1Id_Character_id");

                entity.HasOne(d => d.Character2)
                    .WithMany(p => p.UsageAgainstCharacterCharacterCharacter2s)
                    .HasForeignKey(d => d.Character2Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UsageAgainstCharacterCharacter_Character2Id_Character_id");
            });

            modelBuilder.Entity<UsageAgainstCharacterWeapon>(entity =>
            {
                entity.ToTable("UsageAgainstCharacterWeapon");

                entity.HasIndex(e => e.CharacterId, "IX_UsageAgainstCharacterWeapon_CharacterId");

                entity.HasIndex(e => e.WeaponId, "IX_UsageAgainstCharacterWeapon_WeaponId");

                entity.HasOne(d => d.Character)
                    .WithMany(p => p.UsageAgainstCharacterWeapons)
                    .HasForeignKey(d => d.CharacterId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UsageAgainstCharacterWeapon_CharacterId_Character_id");

                entity.HasOne(d => d.Weapon)
                    .WithMany(p => p.UsageAgainstCharacterWeapons)
                    .HasForeignKey(d => d.WeaponId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UsageAgainstCharacterWeapon_WeaponId_Weapon_id");
            });

            modelBuilder.Entity<UsageAgainstWeaponWeapon>(entity =>
            {
                entity.ToTable("UsageAgainstWeaponWeapon");

                entity.HasIndex(e => e.Weapon1Id, "IX_UsageAgainstWeaponWeapon_Weapon1Id");

                entity.HasIndex(e => e.Weapon2Id, "IX_UsageAgainstWeaponWeapon_Weapon2Id");

                entity.HasOne(d => d.Weapon1)
                    .WithMany(p => p.UsageAgainstWeaponWeaponWeapon1s)
                    .HasForeignKey(d => d.Weapon1Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UsageAgainstWeaponWeapon_Weapon1Id_Weapon_id");

                entity.HasOne(d => d.Weapon2)
                    .WithMany(p => p.UsageAgainstWeaponWeaponWeapon2s)
                    .HasForeignKey(d => d.Weapon2Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UsageAgainstWeaponWeapon_Weapon2Id_Weapon_id");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User");

                entity.HasIndex(e => e.PersonId, "IX_User_PersonId");

                entity.HasIndex(e => e.RoleId, "IX_User_RoleId");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.Person)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.PersonId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_User_PersonId_Person_id");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_User_RoleId_Role_id");
            });

            modelBuilder.Entity<VersionInfo>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("VersionInfo");

                entity.HasIndex(e => e.Version, "UC_Version")
                    .IsUnique()
                    .IsClustered();

                entity.Property(e => e.AppliedOn).HasColumnType("datetime");

                entity.Property(e => e.Description).HasMaxLength(1024);
            });

            modelBuilder.Entity<Weapon>(entity =>
            {
                entity.ToTable("Weapon");

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<WeaponDetail>(entity =>
            {
                entity.HasIndex(e => e.SeasonId, "IX_WeaponDetails_SeasonId");

                entity.HasIndex(e => e.WeaponId, "IX_WeaponDetails_WeaponId");

                entity.HasOne(d => d.Season)
                    .WithMany(p => p.WeaponDetails)
                    .HasForeignKey(d => d.SeasonId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_WeaponDetails_SeasonId_Season_id");

                entity.HasOne(d => d.Weapon)
                    .WithMany(p => p.WeaponDetails)
                    .HasForeignKey(d => d.WeaponId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_WeaponDetails_WeaponId_Weapon_id");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
