

var htmlContent = """
<!DOCTYPE html>
<html>
  <head>
    <title>Invoice Template Design</title>
    <style>
      :root {
        --primary: #0000ff;
        --secondary: #3d3d3d;
        --white: #fff
      }

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Lato, sans-serif
      }

      body {
        background: var(--secondary);
        padding: 50px;
        color: var(--secondary);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px
      }

      .bold {
        font-weight: 900
      }

      .light {
        font-weight: 100
      }

      .wrapper {
        background: var(--white);
        padding: 30px
      }

      .invoice_wrapper {
        border: 3px solid var(--primary);
        width: 700px;
        max-width: 100%
      }

      .invoice_wrapper .header .logo_invoice_wrap {
        display: flex;
        justify-content: space-between;
        padding: 30px
      }

      .invoice_wrapper .header .bill_total_wrap {
        display: flex;
        justify-content: space-between;
        padding-left: 30px;
        padding-bottom: 20px;
        padding-right: 30px
      }

      .invoice_wrapper .header .logo_sec {
        display: flex;
        align-items: center;
        justify-content: space-evenly
      }

      .invoice_wrapper .shop_address_info {
        display: flex;
        justify-content: center
      }

      .invoice_wrapper .header .logo_sec .title_wrap {
        margin-left: 5px
      }

      .invoice_wrapper .header .logo_sec .title_wrap .title {
        text-transform: uppercase;
        font-size: 40px;
        color: var(--primary)
      }

      .invoice_wrapper .header .logo_sec .title_wrap .sub_title {
        font-size: 12px
      }

      .invoice_wrapper .header .bill_total_wrap .total_wrap,
      .invoice_wrapper .header .invoice_sec {
        text-align: right
      }

      .invoice_wrapper .header .invoice_sec .invoice {
        font-size: 28px;
        color: var(--primary)
      }

      .invoice_wrapper .header .invoice_sec .date,
      .invoice_wrapper .header .invoice_sec .invoice_no {
        display: flex;
        width: 100%
      }

      .invoice_wrapper .header .invoice_sec .date span:first-child,
      .invoice_wrapper .header .invoice_sec .invoice_no span:first-child {
        width: 70px;
        text-align: left
      }

      .invoice_wrapper .header .invoice_sec .date span:last-child,
      .invoice_wrapper .header .invoice_sec .invoice_no span:last-child {
        width: calc(100% - 70px)
      }

      .invoice_wrapper .header .bill_total_wrap .bill_sec .name,
      .invoice_wrapper .header .bill_total_wrap .total_wrap .price {
        color: var(--primary);
        font-size: 20px
      }

      .invoice_wrapper .body .main_table .table_header {
        background: var(--primary)
      }

      .invoice_wrapper .body .main_table .table_header .row {
        color: var(--white);
        font-size: 18px;
        border-bottom: 0
      }

      .invoice_wrapper .body .main_table .row {
        display: flex;
        border-bottom: 1px solid var(--secondary)
      }

      .invoice_wrapper .body .main_table .row .col {
        padding: 10px
      }

      .invoice_wrapper .body .main_table .row .col_no {
        width: 5%
      }

      .invoice_wrapper .body .main_table .row .col_des {
        width: 45%
      }

      .invoice_wrapper .body .main_table .row .col_price {
        width: 20%;
        text-align: center
      }

      .invoice_wrapper .body .main_table .row .col_qty {
        width: 10%;
        text-align: center
      }

      .invoice_wrapper .body .main_table .row .col_total {
        width: 20%;
        text-align: right
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap {
        display: flex;
        justify-content: space-between;
        padding: 5px 0 30px;
        align-items: flex-end
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap .paymethod_sec {
        padding-left: 30px
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap .paymethod_sec .unpaid {
        background-color: #ef7c94;
        text-align: center
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec {
        width: 30%
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec p {
        display: flex;
        width: 100%;
        padding-bottom: 5px
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec p span {
        padding: 0 10px
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec p span:first-child {
        width: 60%
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec p span:last-child {
        width: 40%;
        text-align: right
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec p:last-child span {
        background: var(--primary);
        padding: 10px;
        color: #fff
      }

      .invoice_wrapper .bank_info {
        display: flex;
        padding: 30px;
        justify-content: space-between
      }

      .invoice_wrapper .footer .bank_info {
        padding: 30px
      }

      .invoice_wrapper .footer>p {
        color: var(--primary);
        text-decoration: underline;
        font-size: 18px;
        padding-bottom: 5px
      }

      .invoice_wrapper .footer .terms .tc {
        font-size: 16px
      }
    </style>
  </head>
  <body>
    <div class="wrapper">
      <div class="invoice_wrapper">
        <div class="header">
          <div class="logo_invoice_wrap">
            <div class="basic_info">
              <p class="gst_in">
                <span class="bold">GSTIN :</span>
                <span>24AAXPJ8653M1ZT</span>
              </p>
              <p class="pan_no">
                <span class="bold">PAN No :</span>
                <span>AAXPJ8653M</span>
              </p>
              <p class="subject">
                <span>Subject to AMRELI Jurisdiction</span>
              </p>
            </div>
            <div class="god">
              <p class="ganeshay">
                <span>Shree Ganeshay Namah</span>
              </p>
              <p class="pan_no">
                <span>Shree Gel Ambe Mataji</span>
              </p>
            </div>
            <div class="number">
              <p class="">
                <span class="bold">Dipakbhai Jogani</span>
              </p>
              <p>
                <span>MO: 98253 99195</span>
              </p>
              <p class="">
                <span class="bold">Khushalbhai Jogani</span>
              </p>
              <p>
                <span>MO: 94287 12703</span>
              </p>
            </div>
          </div>
          <div class="logo_sec">
            <img src="assets/img/Divo.jpeg" alt="code logo" width="20" height="20">
            <div class="title_wrap">
              <p class="title bold">Jogani Brothers</p>
            </div>
            <img src="assets/img/Divo.jpeg" alt="code logo" width="20" height="20">
          </div>
          <div class="shop_address_info">
            <p>
              <span class="bold" style="padding-left:15%">General Merchanat & Commission Agent</span>
              <br>
              <span class="bold">Shop No 11, Market Yard Savrkundla Road, Amreli - 365601</span>
            </p>
          </div>
          <div class="logo_invoice_wrap">
            <div class="warehouse_address_info">
              <p class="warehouse">
                <span class="bold">Warehouse</span>
              </p>
              <p>
                <span>Street no: 5,Rampara Kunkavav road,</span>
              </p>
              <p>
                <span>Amreli - 365601</span>
              </p>
            </div>
            <div>
              <p class="invoice_no">
                <span class="bold">Bill No:</span>
                <span>#3488</span>
              </p>
              <p class="date">
                <span class="bold">Date:</span>
                <span>08/Jan/2022</span>
              </p>
            </div>
          </div>
          <div class="bill_total_wrap">
            <div class="bill_sec">
              <p>
                <span class="bold">Bill To:</span>
                <br \>
                <span>Himanshu Dipakbhai Jogani</span>
              </p>
            </div>
            <div class="address">
              <p>
                <span class="bold">Address:</span>
                <br \>
                <samp>Jeshingpara street no: 5</samp>
              </p>
            </div>
          </div>
        </div>
        <div class="body">
          <div class="main_table">
            <div class="table_header">
              <div class="row">
                <div class="col col_no">NO.</div>
                <div class="col col_des">ITEM DESCRIPTION</div>
                <div class="col col_price">PRICE</div>
                <div class="col col_qty">WEIGHT</div>
                <div class="col col_total">TOTAL</div>
              </div>
            </div>
            <div class="table_body">
              <div class="row">
                <div class="col col_no">
                  <p>01</p>
                </div>
                <div class="col col_des">
                  <p class="bold">Web Design</p>
                  <p>Lorem ipsum dolor sit.</p>
                </div>
                <div class="col col_price">
                  <p>${350}</p>
                </div>
                <div class="col col_qty">
                  <p>2</p>
                </div>
                <div class="col col_total">
                  <p>700.00</p>
                </div>
              </div>
              <div class="row">
                <div class="col col_no">
                  <p>02</p>
                </div>
                <div class="col col_des">
                  <p class="bold">Web Development</p>
                  <p>Lorem ipsum dolor sit.</p>
                </div>
                <div class="col col_price">
                  <p>350</p>
                </div>
                <div class="col col_qty">
                  <p>2</p>
                </div>
                <div class="col col_total">
                  <p>700.00</p>
                </div>
              </div>
              <div class="row">
                <div class="col col_no">
                  <p>03</p>
                </div>
                <div class="col col_des">
                  <p class="bold">GitHub</p>
                  <p>Lorem ipsum dolor sit.</p>
                </div>
                <div class="col col_price">
                  <p>120</p>
                </div>
                <div class="col col_qty">
                  <p>1</p>
                </div>
                <div class="col col_total">
                  <p>700.00</p>
                </div>
              </div>
              <div class="row">
                <div class="col col_no">
                  <p>04</p>
                </div>
                <div class="col col_des">
                  <p class="bold">Backend Design</p>
                  <p>Lorem ipsum dolor sit.</p>
                </div>
                <div class="col col_price">
                  <p>350</p>
                </div>
                <div class="col col_qty">
                  <p>2</p>
                </div>
                <div class="col col_total">
                  <p>700.00</p>
                </div>
              </div>
            </div>
          </div>
          <div class="paymethod_grandtotal_wrap">
            <div class="paymethod_sec">
              <p class="bold">Payment Status</p>
              <p class="unpaid">UNPAID</p>
            </div>
            <div class="grandtotal_sec">
              <p class="bold">
                <span>SUB TOTAL</span>
                <span>7500</span>
              </p>
              <p>
                <span>Tax Vat 18%</span>
                <span>200</span>
              </p>
              <p>
                <span>Discount 10%</span>
                <span>-700</span>
              </p>
              <p class="bold">
                <span>Grand Total</span>
                <span>7000.0</span>
              </p>
            </div>
          </div>
        </div>
        <div class="bank_info">
          <div>
            <p>
              <span class="bold">BANK OF BARODA</span>
            </p>
            <p>
              <span>A/C NO: 95740500000576</span>
            </p>
            <p>
              <span>IFSC: BARB0AMRELI</span>
            </p>
            <p>Thank you and Best Wishes</p>
          </div>
          <div>
            <p>
              <span class="bold">JOGANI BROTHERS</span>
              <br \>
              <span>sig:</span>
            </p>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
""";
