use PRD_DB_AZU_Live_ManagementCore
select top 10 * from tb_projectconfiguration
where name like '%banrisul%'

select * from tb_project
where id = 10149


select top 10 * from tb_skin
where ProjectId = 10149

update tb_skin set active = 1
where id = 10146

select top 10 * from tb_skinurl
where skinId = 10146

update tb_skinurl set mainurl = 0
where id = 30393

begin transaction 

commit transaction 
rollback transaction 