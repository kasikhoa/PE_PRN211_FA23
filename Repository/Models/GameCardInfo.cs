﻿using System;
using System.Collections.Generic;

namespace Repository.Models
{
    public partial class GameCardInfo
    {
        public int GameCardId { get; set; }
        public string GameCardName { get; set; } = null!;
        public string? GameDescription { get; set; }
        public string? GamePlatform { get; set; }
        public decimal? Price { get; set; }
        public int? Quantity { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string? ProviderId { get; set; }

        public virtual Provider? Provider { get; set; }
    }
}
