﻿using Monitor.Constant;
using System;

namespace Monitor.Domain
{
	/// <summary>
	/// 类名：WarningSqlInfo.cs
	/// 类属性：公共类（非静态）
	/// 类功能描述：SQL预警信息
	/// 创建标识：template 2017-11-29 22:17:29
	/// </summary>
	public sealed class WarningSqlInfo
	{
		/// <summary>
		/// 主键
		/// </summary>
		public int FID { get; set; }

		/// <summary>
		/// SQL记录ID
		/// </summary>
		public int FRuntimeSqlID { get; set; }

		/// <summary>
		/// SQL标识
		/// </summary>
		public int FSqlSign { get; set; }

		/// <summary>
		/// 处理建议
		/// </summary>
		public string FOperateAdvice { get; set; }

		/// <summary>
		/// 通知状态(1:未通知 2:已通知 3:通知失败)
		/// </summary>
		public NoticeState FNoticeState { get; set; }

		/// <summary>
		/// 处理状态(1:待处理,2:已处理,3:不处理)
		/// </summary>
		public DealState FDealState { get; set; }

		/// <summary>
		/// 处理方案
		/// </summary>
		public string FTreatmentScheme { get; set; }

		/// <summary>
		/// 是否删除
		/// </summary>
		public bool FIsDeleted { get; set; }

		/// <summary>
		/// 创建时间
		/// </summary>
		public DateTime FCreateTime { get; set; }

		/// <summary>
		/// 创建人ID
		/// </summary>
		public int FCreateUserID { get; set; }

		/// <summary>
		/// 最后修改时间
		/// </summary>
		public DateTime? FLastModifyTime { get; set; }

		/// <summary>
		/// 最后修改人ID
		/// </summary>
		public int? FLastModifyUserID { get; set; }

	}
}
