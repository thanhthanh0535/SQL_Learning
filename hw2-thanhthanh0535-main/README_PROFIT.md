Classic Models is a product distributor. They sit in between the manufacturers
of the products (in this case diecast models) and potential retailers (stores
that you and I would buy them from). So Classic Models makes money by selling to
retailers for more than they purchased them for from manufacturers. So here's a
quick distributor product pricing glossary:

   __NOTE__: I'm using short aliases for these tables, so "prod" = "products"
   and "od" = "orderdetails".

 * _Advertised Price_ ⇒ Asking Price or MSRP (Manufacturer’s Suggested Retail
   Price). This is the amount that the product manufacturer expects the product
   to sell for. Note that a retailer should never pay this amount to a
   distributor if they expect to make any money. Though apparently this is not
   always the case here, as we will find out.

    _Field: prod.MSRP_

 * _Item Cost_ ⇒ Purchase price / amount paid by Classic Models to product
   manufacturer.

    __Field__: prod.BuyPrice

 * _Sales Price_ ⇒ Price paid by customer to Classic Models. I.e., the income from the sale.

    __Field__: od.PriceEach

 * _Potential Profit_ ⇒ Earning Potential per unit sold. I.e., MSRP – Purchase Price.

    __Expression__: prod.MSRP – prod.BuyPrice

 * _Actual Profit_ ⇒ Actual amount Earned per unit sold. I.e., Sales Price – Purchase Price.

    __Expression__: od.PriceEach – prod.BuyPrice

 * _Total Profit_ ⇒ Simply the actual profit times the number of items sold.

    __Expression__: (od.PriceEach – prod.BuyPrice) * od.QuantityOrdered

 * _Profit Margin_ ⇒ Ratio of profit to sales. For example, if you make $25
   profit on a product that you sold for $100, then your profit margin is 25/100
   or 0.25 or 25%. We could get "potential" profit margin or "actual" profit margin
   depending on which of the above we use.

    __Expression__: (prod.MSRP – prod.BuyPrice) / prod.MSRP

   _or_

    __Expression__: (od.PriceEach – prod.BuyPrice) / od.PriceEach

Note that above, these are actually called "gross" profits, but we'll just keep
it clean and leave off the gross modifier.
