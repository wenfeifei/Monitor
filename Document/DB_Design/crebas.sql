/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2017/9/23 20:02:53                           */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('M_Admin')
            and   type = 'U')
   drop table M_Admin
go

if exists (select 1
            from  sysobjects
           where  id = object_id('M_AdminDetail')
            and   type = 'U')
   drop table M_AdminDetail
go

if exists (select 1
            from  sysobjects
           where  id = object_id('M_OperateLog')
            and   type = 'U')
   drop table M_OperateLog
go

if exists (select 1
            from  sysobjects
           where  id = object_id('M_Project')
            and   type = 'U')
   drop table M_Project
go

if exists (select 1
            from  sysobjects
           where  id = object_id('M_RuntimeLog')
            and   type = 'U')
   drop table M_RuntimeLog
go

if exists (select 1
            from  sysobjects
           where  id = object_id('M_Servcer')
            and   type = 'U')
   drop table M_Servcer
go

if exists (select 1
            from  sysobjects
           where  id = object_id('M_WarningInfoOperateLog')
            and   type = 'U')
   drop table M_WarningInfoOperateLog
go

if exists (select 1
            from  sysobjects
           where  id = object_id('M_WarningLog')
            and   type = 'U')
   drop table M_WarningLog
go

/*==============================================================*/
/* Table: M_Admin                                               */
/*==============================================================*/
create table M_Admin (
   FID                  int                  identity(1,1),
   FEmail               varchar(100)         null,
   FName                nvarchar(50)         null,
   FPwdSalt             varchar(10)          null,
   FPwd                 varchar(32)          null,
   FState               int                  not null,
   FIsDeleted           bit                  not null,
   FCreateTime          datetime             not null,
   FCreateUserID        int                  not null,
   FLastModifyTime      datetime             null,
   FLastModifyUserID    int                  null,
   constraint PK_M_ADMIN primary key (FID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('M_Admin') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'M_Admin' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '管理员', 
   'user', @CurrentUser, 'table', 'M_Admin'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Admin')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '管理员ID',
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Admin')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FEmail')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FEmail'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮箱',
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FEmail'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Admin')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '名字',
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Admin')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FPwdSalt')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FPwdSalt'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '密码盐值',
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FPwdSalt'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Admin')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FPwd')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FPwd'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '密码',
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FPwd'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Admin')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FState')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FState'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '管理员状态(1:正常,10:禁用,20:注销)',
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FState'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Admin')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FIsDeleted')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FIsDeleted'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除',
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FIsDeleted'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Admin')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FCreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FCreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Admin')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCreateUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FCreateUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人ID',
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FCreateUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Admin')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLastModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FLastModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改时间',
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FLastModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Admin')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLastModifyUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FLastModifyUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改人ID',
   'user', @CurrentUser, 'table', 'M_Admin', 'column', 'FLastModifyUserID'
go

/*==============================================================*/
/* Table: M_AdminDetail                                         */
/*==============================================================*/
create table M_AdminDetail (
   FID                  int                  identity(1,1),
   FAdminID             int                  not null,
   FlastLoginTime       datetime             null,
   FLastLoginIP         varchar(15)          null,
   FLastChangePwdTime   datetime             null,
   FIsDeleted           bit                  not null,
   FCreateTime          datetime             not null,
   FCreateUserID        int                  not null,
   FLastModifyTime      datetime             null,
   FLastModifyUserID    int                  null,
   constraint PK_M_ADMINDETAIL primary key (FID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('M_AdminDetail') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'M_AdminDetail' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '管理员详情信息', 
   'user', @CurrentUser, 'table', 'M_AdminDetail'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_AdminDetail')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键、自增',
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_AdminDetail')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FAdminID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FAdminID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '管理员ID',
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FAdminID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_AdminDetail')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FlastLoginTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FlastLoginTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后一次登录时间',
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FlastLoginTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_AdminDetail')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLastLoginIP')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FLastLoginIP'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后一次登录IP',
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FLastLoginIP'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_AdminDetail')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLastChangePwdTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FLastChangePwdTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后一次修改密码时间',
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FLastChangePwdTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_AdminDetail')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FIsDeleted')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FIsDeleted'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除',
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FIsDeleted'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_AdminDetail')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FCreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FCreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_AdminDetail')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCreateUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FCreateUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人ID',
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FCreateUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_AdminDetail')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLastModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FLastModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改时间',
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FLastModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_AdminDetail')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLastModifyUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FLastModifyUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改人ID',
   'user', @CurrentUser, 'table', 'M_AdminDetail', 'column', 'FLastModifyUserID'
go

/*==============================================================*/
/* Table: M_OperateLog                                          */
/*==============================================================*/
create table M_OperateLog (
   FID                  int                  identity(1,1),
   FAdminID             int                  not null,
   FModuleType          int                  not null,
   FModuleNodeType      int                  not null,
   FOperateIP           varchar(15)          null,
   FOperateUrl          varchar(150)         null,
   FOperateContent      nvarchar(256)        null,
   FIsDeleted           bit                  not null,
   FCreateTime          datetime             not null,
   FCreateUserID        int                  not null,
   FLastModifyTime      datetime             null,
   FLastModifyUserID    int                  null,
   constraint PK_M_OPERATELOG primary key (FID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('M_OperateLog') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'M_OperateLog' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '管理员操作记录', 
   'user', @CurrentUser, 'table', 'M_OperateLog'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_OperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键、自增',
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_OperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FAdminID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FAdminID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '管理员ID',
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FAdminID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_OperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FModuleType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FModuleType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作模块类型(枚举)',
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FModuleType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_OperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FModuleNodeType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FModuleNodeType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作模块节点类型',
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FModuleNodeType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_OperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FOperateIP')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FOperateIP'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作IP',
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FOperateIP'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_OperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FOperateUrl')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FOperateUrl'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作地址',
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FOperateUrl'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_OperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FOperateContent')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FOperateContent'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作内容',
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FOperateContent'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_OperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FIsDeleted')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FIsDeleted'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除',
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FIsDeleted'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_OperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FCreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FCreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_OperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCreateUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FCreateUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人ID',
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FCreateUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_OperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLastModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FLastModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改时间',
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FLastModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_OperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLastModifyUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FLastModifyUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改人ID',
   'user', @CurrentUser, 'table', 'M_OperateLog', 'column', 'FLastModifyUserID'
go

/*==============================================================*/
/* Table: M_Project                                             */
/*==============================================================*/
create table M_Project (
   FID                  int                  identity(1,1),
   FName                varchar(100)         null,
   FComment             nvarchar(200)        null,
   FIsDeleted           bit                  not null,
   FCreateTime          datetime             not null,
   FCreateUserID        int                  not null,
   FLastModifyTime      datetime             null,
   FLastModifyUserID    int                  null,
   constraint PK_M_PROJECT primary key (FID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('M_Project') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'M_Project' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '项目信息', 
   'user', @CurrentUser, 'table', 'M_Project'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Project', 'column', 'FID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目ID(主键、自增)',
   'user', @CurrentUser, 'table', 'M_Project', 'column', 'FID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Project', 'column', 'FName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目名字(唯一、不重复)',
   'user', @CurrentUser, 'table', 'M_Project', 'column', 'FName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FComment')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Project', 'column', 'FComment'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目说明',
   'user', @CurrentUser, 'table', 'M_Project', 'column', 'FComment'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FIsDeleted')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Project', 'column', 'FIsDeleted'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除',
   'user', @CurrentUser, 'table', 'M_Project', 'column', 'FIsDeleted'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Project', 'column', 'FCreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'M_Project', 'column', 'FCreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCreateUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Project', 'column', 'FCreateUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人ID',
   'user', @CurrentUser, 'table', 'M_Project', 'column', 'FCreateUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLastModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Project', 'column', 'FLastModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改时间',
   'user', @CurrentUser, 'table', 'M_Project', 'column', 'FLastModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLastModifyUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Project', 'column', 'FLastModifyUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改人ID',
   'user', @CurrentUser, 'table', 'M_Project', 'column', 'FLastModifyUserID'
go

/*==============================================================*/
/* Table: M_RuntimeLog                                          */
/*==============================================================*/
create table M_RuntimeLog (
   FID                  int                  identity(1,1),
   FLogLevel            int                  not null,
   FProjectID           int                  not null,
   FProjectName         varchar(128)         null,
   FServerID            int                  not null,
   FServerMac           varchar(128)         null,
   FCallMemberName      varchar(128)         null,
   FContent             varchar(max)         null,
   FSource              int                  not null,
   FExecuteTime         datetime             not null,
   FCreateTime          datetime             not null,
   FIsDeleted           bit                  not null,
   constraint PK_M_RUNTIMELOG primary key (FID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('M_RuntimeLog') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'M_RuntimeLog' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '运行日志信息', 
   'user', @CurrentUser, 'table', 'M_RuntimeLog'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_RuntimeLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键、自增',
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_RuntimeLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLogLevel')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FLogLevel'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志级别',
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FLogLevel'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_RuntimeLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FProjectID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FProjectID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '所属项目',
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FProjectID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_RuntimeLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FProjectName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FProjectName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目名字',
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FProjectName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_RuntimeLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FServerID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FServerID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '部署服务器ID',
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FServerID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_RuntimeLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FServerMac')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FServerMac'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '服务器Mac地址',
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FServerMac'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_RuntimeLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCallMemberName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FCallMemberName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '调用方法名字',
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FCallMemberName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_RuntimeLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FContent')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FContent'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志内容',
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FContent'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_RuntimeLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FSource')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FSource'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志来源【1:前端,2:后台,3:IOS,4:Android,5:API,6:其它】',
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FSource'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_RuntimeLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FExecuteTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FExecuteTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志生成时间',
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FExecuteTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_RuntimeLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FCreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '添加时间',
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FCreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_RuntimeLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FIsDeleted')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FIsDeleted'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除',
   'user', @CurrentUser, 'table', 'M_RuntimeLog', 'column', 'FIsDeleted'
go

/*==============================================================*/
/* Table: M_Servcer                                             */
/*==============================================================*/
create table M_Servcer (
   FID                  int                  identity(1,1),
   FMacAddress          varchar(128)         null,
   FIP                  varchar(64)          null,
   FName                varchar(128)         null,
   FComment             nvarchar(200)        null,
   FIsDeleted           bit                  not null,
   FCreateTime          datetime             not null,
   FCreateUserID        int                  not null,
   FLastModifyTime      datetime             null,
   FLastModifyUserID    int                  null,
   constraint PK_M_SERVCER primary key (FID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('M_Servcer') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'M_Servcer' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '服务器信息', 
   'user', @CurrentUser, 'table', 'M_Servcer'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Servcer')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '服务器ID(主键、自增)',
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Servcer')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FMacAddress')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FMacAddress'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'MAC地址',
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FMacAddress'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Servcer')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FIP')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FIP'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '服务器IP(多个用逗号隔开)',
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FIP'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Servcer')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '服务器名字',
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Servcer')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FComment')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FComment'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '服务器说明',
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FComment'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Servcer')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FIsDeleted')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FIsDeleted'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除',
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FIsDeleted'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Servcer')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FCreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FCreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Servcer')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCreateUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FCreateUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人ID',
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FCreateUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Servcer')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLastModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FLastModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改时间',
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FLastModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_Servcer')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLastModifyUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FLastModifyUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改人ID',
   'user', @CurrentUser, 'table', 'M_Servcer', 'column', 'FLastModifyUserID'
go

/*==============================================================*/
/* Table: M_WarningInfoOperateLog                               */
/*==============================================================*/
create table M_WarningInfoOperateLog (
   FID                  int                  identity(1,1),
   FType                int                  not null,
   FWarningInfoID       int                  not null,
   FOperateIP           varchar(15)          null,
   FOperateUrl          varchar(150)         null,
   FOperateContent      nvarchar(256)        null,
   FIsDeleted           bit                  not null,
   FCreateTime          datetime             not null,
   FCreateUserID        int                  not null,
   FLastModifyTime      datetime             null,
   FLastModifyUserID    int                  null,
   constraint PK_M_WARNINGINFOOPERATELOG primary key (FID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('M_WarningInfoOperateLog') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '预警信息操作记录', 
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningInfoOperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键自增',
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningInfoOperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '预警信息类型(1:日志)',
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningInfoOperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FWarningInfoID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FWarningInfoID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '预警信息ID',
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FWarningInfoID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningInfoOperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FOperateIP')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FOperateIP'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作IP',
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FOperateIP'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningInfoOperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FOperateUrl')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FOperateUrl'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作地址',
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FOperateUrl'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningInfoOperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FOperateContent')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FOperateContent'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作内容',
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FOperateContent'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningInfoOperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FIsDeleted')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FIsDeleted'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除',
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FIsDeleted'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningInfoOperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FCreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FCreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningInfoOperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCreateUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FCreateUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人ID',
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FCreateUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningInfoOperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLastModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FLastModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改时间',
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FLastModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningInfoOperateLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLastModifyUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FLastModifyUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改人ID',
   'user', @CurrentUser, 'table', 'M_WarningInfoOperateLog', 'column', 'FLastModifyUserID'
go

/*==============================================================*/
/* Table: M_WarningLog                                          */
/*==============================================================*/
create table M_WarningLog (
   FID                  int                  identity(1,1),
   FRunTimeLogID        int                  not null,
   FLogSign             int                  not null,
   FOperateAdvice       varchar(256)         null,
   FNoticeState         int                  not null,
   FDealState           int                  not null,
   FTreatmentScheme     varchar(256)         null,
   FIsDeleted           bit                  not null,
   FCreateTime          datetime             not null,
   FCreateUserID        int                  not null,
   FLastModifyTime      datetime             null,
   FLastModifyUserID    int                  null,
   constraint PK_M_WARNINGLOG primary key (FID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('M_WarningLog') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'M_WarningLog' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '日志预警信息', 
   'user', @CurrentUser, 'table', 'M_WarningLog'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键ID',
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FRunTimeLogID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FRunTimeLogID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志记录ID',
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FRunTimeLogID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLogSign')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FLogSign'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志标识',
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FLogSign'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FOperateAdvice')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FOperateAdvice'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '处理建议',
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FOperateAdvice'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FNoticeState')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FNoticeState'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '通知状态(1:未通知 2:已通知 3:通知失败)',
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FNoticeState'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FDealState')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FDealState'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '处理状态(1:待处理,2:已处理,3:不处理)',
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FDealState'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FTreatmentScheme')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FTreatmentScheme'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '处理方案',
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FTreatmentScheme'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FIsDeleted')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FIsDeleted'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除',
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FIsDeleted'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FCreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FCreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCreateUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FCreateUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人ID',
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FCreateUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLastModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FLastModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改时间',
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FLastModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('M_WarningLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FLastModifyUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FLastModifyUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改人ID',
   'user', @CurrentUser, 'table', 'M_WarningLog', 'column', 'FLastModifyUserID'
go
