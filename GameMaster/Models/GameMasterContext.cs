﻿using System;
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
        public virtual DbSet<GamePlayer> GamePlayers { get; set; }
        public virtual DbSet<History> Histories { get; set; }
        public virtual DbSet<Person> People { get; set; }
        public virtual DbSet<Player> Players { get; set; }
        public virtual DbSet<Rank> Ranks { get; set; }
        public virtual DbSet<Region> Regions { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Season> Seasons { get; set; }
        public virtual DbSet<Synergy> Synergies { get; set; }
        public virtual DbSet<UsageAgainstCharacterCharacter> UsageAgainstCharacterCharacters { get; set; }
        public virtual DbSet<UsageAgainstCharacterWeapon> UsageAgainstCharacterWeapons { get; set; }
        public virtual DbSet<UsageAgainstWeaponWeapon> UsageAgainstWeaponWeapons { get; set; }
        public virtual DbSet<UsageWith> UsageWiths { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<VersionInfo> VersionInfos { get; set; }
        public virtual DbSet<Weapon> Weapons { get; set; }
        public virtual DbSet<WeaponDetail> WeaponDetails { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
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

                entity.HasIndex(e => e.RegionId, "IX_Game_RegionId");

                entity.HasIndex(e => e.SeasonId, "IX_Game_SeasonId");

                entity.HasIndex(e => e.WinnerId, "IX_Game_WinnerId");

                entity.Property(e => e.StartTime).HasColumnType("datetime");

                entity.HasOne(d => d.Region)
                    .WithMany(p => p.Games)
                    .HasForeignKey(d => d.RegionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Game_RegionId_Region_id");

                entity.HasOne(d => d.Season)
                    .WithMany(p => p.Games)
                    .HasForeignKey(d => d.SeasonId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Game_SeasonId_Season_id");

                entity.HasOne(d => d.Winner)
                    .WithMany(p => p.Games)
                    .HasForeignKey(d => d.WinnerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Game_WinnerId_Player_id");
            });

            modelBuilder.Entity<GamePlayer>(entity =>
            {
                entity.ToTable("GamePlayer");

                entity.HasIndex(e => e.CharacterId, "IX_GamePlayer_CharacterId");

                entity.HasIndex(e => e.GameId, "IX_GamePlayer_GameId");

                entity.HasIndex(e => e.PlayerId, "IX_GamePlayer_PlayerId");

                entity.HasIndex(e => e.WeaponId, "IX_GamePlayer_WeaponId");

                entity.HasOne(d => d.Character)
                    .WithMany(p => p.GamePlayers)
                    .HasForeignKey(d => d.CharacterId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GamePlayer_CharacterId_Character_id");

                entity.HasOne(d => d.Game)
                    .WithMany(p => p.GamePlayers)
                    .HasForeignKey(d => d.GameId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GamePlayer_GameId_Player_id");

                entity.HasOne(d => d.Player)
                    .WithMany(p => p.GamePlayers)
                    .HasForeignKey(d => d.PlayerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GamePlayer_PlayerId_Game_id");

                entity.HasOne(d => d.Weapon)
                    .WithMany(p => p.GamePlayers)
                    .HasForeignKey(d => d.WeaponId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GamePlayer_WeaponId_Weapon_id");
            });

            modelBuilder.Entity<History>(entity =>
            {
                entity.ToTable("History");

                entity.HasIndex(e => e.UserId, "IX_History_UserId");

                entity.Property(e => e.Message)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.Property(e => e.TimeCreated).HasColumnType("datetime");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Histories)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_History_UserId_User_id");
            });

            modelBuilder.Entity<Person>(entity =>
            {
                entity.ToTable("Person");

                entity.Property(e => e.Birthday).HasColumnType("date");

                entity.Property(e => e.DateCreated).HasColumnType("datetime");

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

                entity.HasIndex(e => e.Name, "IX_Player_Name")
                    .IsUnique();

                entity.HasIndex(e => e.PersonId, "IX_Player_PersonId");

                entity.HasIndex(e => e.RankId, "IX_Player_RankId");

                entity.HasIndex(e => e.RegionId, "IX_Player_RegionId");

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

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

                entity.Property(e => e.Id).ValueGeneratedNever();

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

                entity.Property(e => e.EndDate).HasColumnType("datetime");

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.StartDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<Synergy>(entity =>
            {
                entity.HasIndex(e => e.CharacterId, "IX_Synergies_CharacterId");

                entity.HasIndex(e => e.WeaponId, "IX_Synergies_WeaponId");

                entity.HasOne(d => d.Character)
                    .WithMany(p => p.Synergies)
                    .HasForeignKey(d => d.CharacterId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Synergies_CharacterId_Character_id");

                entity.HasOne(d => d.Weapon)
                    .WithMany(p => p.Synergies)
                    .HasForeignKey(d => d.WeaponId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Synergies_WeaponId_Weapon_id");
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

            modelBuilder.Entity<UsageWith>(entity =>
            {
                entity.ToTable("UsageWith");

                entity.HasIndex(e => e.CharacterId, "IX_UsageWith_CharacterId");

                entity.HasIndex(e => e.WeaponId, "IX_UsageWith_WeaponId");

                entity.HasOne(d => d.Character)
                    .WithMany(p => p.UsageWiths)
                    .HasForeignKey(d => d.CharacterId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UsageWith_CharacterId_Character_id");

                entity.HasOne(d => d.Weapon)
                    .WithMany(p => p.UsageWiths)
                    .HasForeignKey(d => d.WeaponId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UsageWith_WeaponId_Weapon_id");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User");

                entity.HasIndex(e => e.Email, "IX_User_Email")
                    .IsUnique();

                entity.HasIndex(e => e.PersonId, "IX_User_PersonId");

                entity.HasIndex(e => e.RoleId, "IX_User_RoleId");

                entity.HasIndex(e => e.Username, "IX_User_Username")
                    .IsUnique();

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasMaxLength(50);

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
