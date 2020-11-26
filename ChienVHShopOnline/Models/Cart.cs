using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ChienVHShopOnline.Models
{
    public class Cart
    {
        public Product Product { get; set; }
        public int Quantity { get; set; }

        public Cart(Product product, int quantity)
        {
            Product = product;
            Quantity = quantity;
        }
    }
}