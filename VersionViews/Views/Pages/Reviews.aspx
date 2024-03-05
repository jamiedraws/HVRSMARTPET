<%@ Page Language="C#" MasterPageFile="~/Shared/Customers/575/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="HVRSMARTPET.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    

<style>
.review__item--stacked {
    margin: 0;
    border-bottom: 0.15em solid #6a4b9d;
    padding: 1.5em 0;
}
.dtm .dtm__in .review__stars {
    max-width: 9em;
    margin: 0 0 0.5em;
}
.review__item--stacked:last-of-type {
    border-bottom: none;
}

.dtm__bazaarvoice--is-ready {
    display: none;
}
</style>

<main aria-labelledby="main-title" class="view">
    <div id="main" class="view__anchor"></div>
    <div class="view__in">
        <div class="copy copy--article">
            <h2 id="main-title">Customer Reviews</h2>
            <div id="bvReviews"></div>
            <div class="dtm__bazaarvoice">
            <blockquote class="review__item review__item--stacked">
                <img src="/images/stars.svg" class="review__stars">
                <h3>Love this so much.</h3>
                <p>This carpet cleaner works beyond wonders with its multi functions and easy to use machine I am in love with this. I have owned about three other cleaners but this one is definitely my top as of now. It is super easy to assemble I did it all by myself. The Instructions are very clear and understandable. I love how it works deep into my carpets and rugs and actually gets the stains and smell out without having to do it over more then once! All my other cleaners I had to go over the spot many times just to get the dirt out and it was a pain! I would highly recommend this to all, it really is worth it.<p>
                <footer><strong>Cbell009</strong>, California</footer>
            </blockquote>

            <blockquote class="review__item review__item--stacked">
                <img src="/images/stars.svg" class="review__stars">
                <h3>Excellent at removing pet hair</h3>
                <p>I got this carpet cleaner a couple of weeks ago and it is amazing. It works on the toughest of stains. I have a Persian cat and she sheds like crazy. Not only does this carpet cleaner work on stains, it also gets the small bits of fur that my vacuum leaves behind. It is very easy to use. It's as easy as just vacuuming. If you are looking to buy a good carpet cleaner, I definitely recommend that you invest in this one.<p>
                <footer><strong>Anonymous</strong>, Williamson, WV</footer>
            </blockquote>

            <blockquote class="review__item review__item--stacked">
                <img src="/images/stars.svg" class="review__stars">
                <h3>Really happy I bought this!</h3>
                <p>Having tried a few carpet cleaners in the past, the SmartWash cleaner the best hands down! Learning to use it was pretty intuitive. I also felt that it was made with ergonomics in mind, and my muscles and joints are thankful :) It is a great cleaning machine - especially on the spots, there was a noticeable difference: they were gone! I do pretreat the stains and that helps as well! I would definitely recommend this cleaner to my friends and anyone who is looking for an effective product!<p>
                <footer><strong>Eli 8</strong>, New York</footer>
            </blockquote>

            <blockquote class="review__item review__item--stacked">
                <img src="/images/stars.svg" class="review__stars">
                <h3>Amazing quality!</h3>
                <p>This was by FAR the best product I have purchased all year! I have two dogs and one cat (and two kids) so our carpet gets dirty all the time! This was by far the best deep cleaner I have ever used before! It completely removed all of the stains, odor and pet hair from my carpet. My mother in law actually asked me if we had replaced the carpet! I would recommend this product to everyone even if you are not a pet owner! I will ONLY buy Hoover from now on!<p>
                <footer><strong>MandiB</strong>, Astor, FL</footer>
            </blockquote>
            
            <blockquote class="review__item review__item--stacked">
                <img src="/images/stars.svg" class="review__stars">
                <h3>Best carpet cleaner</h3>
                <p>I am thrilled with this vacuum.I never realized how dirty my carpets were until I used this.It is very easy to use. The parts disassemble easily for cleaning.I love that is is automatic.You can clean around two rooms with a full tank.For the value this product is definitely worth it.<p>
                <footer><strong>Cavy</strong>, Houston</footer>
            </blockquote>

            <blockquote class="review__item review__item--stacked">
                <img src="/images/stars.svg" class="review__stars">
                <h3>Cleans my carpets so well!</h3>
                <p>I've been using my Hoover SmartWash carpet cleaner for a few weeks now, and am so pleased with the performance and results! I've had a few dirty spots and stains that I've wanted to have removed from my carpets, so I used my SmartWash carpet cleaner and the stains are gone!! I've even been able to remove urine spots from our family pet and general spills and stains made by our kids. I have been so amazed at how powerful and easy to use the machine is. My carpets look and smell like new again!<p>
                <footer><strong>Melliemel</strong>, Sevierville</footer>
            </blockquote>

            <blockquote class="review__item review__item--stacked">
                <img src="/images/stars.svg" class="review__stars">
                <h3>Got out old stains too.</h3>
                <p>I can't even believe how much dirt this got out of my carpet! The water was dark and loaded with dirt. I swear the living room rug didn't look that dirty, but now it looks great. We have 2 cats and a dog, and 2 kids....we spend a lot of time In the living room, and it shows. Our living room is on the smaller side, it took about 2 hours to wash and then do an extra dry only cycle. We had some old stains, that came out with no extra effort. I love the spot wand, when you have pets, there are always spots. I will definitely be cleaning my carpets regularly with this. It is heavy but maneuvers easily.<p>
                <footer><strong>Aim72</strong>, Terryville, CT</footer>
            </blockquote>
            
            <blockquote class="review__item review__item--stacked">
                <img src="/images/stars.svg" class="review__stars">
                <h3>Better than Pro</h3>
                <p>An amazing pet carpet cleaner that truly does everything that is states. Super powerful and pulls up pet hair like nothing I have seen before. Easy to assemble and start using. Super suction like no other carpet cleaner I have used. Pulls out dirt and grime and leaves the carpet vibrant clean and looking just like new. This machine has been more effective and cleaned better than calling a professional cleaner into my home.<p>
                <footer><strong>DrumlineMom</strong>, Columbus, OH</footer>
            </blockquote>
            
            <blockquote class="review__item review__item--stacked">
                <img src="/images/stars.svg" class="review__stars">
                <h3>Great brand</h3>
                <p>Extremely easy to assemble. The ease of use is phenomenal great brand that cleans with ease. I have 3 dogs and had messes from them and it works great. Isn't heavy and the attachments are great for all around clean ability.<p>
                <footer><strong>Jessikanne19</strong>, Grand Rapids, MI</footer>
            </blockquote>

            <blockquote class="review__item review__item--stacked">
                <img src="/images/stars.svg" class="review__stars">
                <h3>Worked wonders!</h3>
                <p>This was my first time using a carpet cleaner in my new home and it worked great! Having two German Shepherds (one being 9 weeks old) and two cats, things can be a little chaotic. This carpet cleaner got all my stains out quick and very easily! It has great features, and I'm very excited to be able to clean my carpets with such ease.<p>
                <footer><strong>Kayy21</strong>, Pittsburgh, PA</footer>
            </blockquote>
            </div>
        </div>
         <div class="view__disclaimer">
            <% Html.RenderSnippet("OFFERDETAILS"); %>
        </div>
    </div>
</main>

</asp:Content>