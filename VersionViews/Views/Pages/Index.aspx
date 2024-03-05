<%@ Page Language="C#" MasterPageFile="~/Shared/Customers/575/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="HVRSMARTPET.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<% 
    var ext = DtmContext.ApplicationExtension;
    var isMobile = DtmContext.IsMobile;
    var isDesktop = !isMobile;
    var callToOrderNumber = new ViewDataDictionary {
        { "Domain", "www.buysmartwashpet.com|www.buysmartwash.com" },
        { "Phone", "1-800-697-4880" },
        { "CallID", "main-offer-call-to-order-phone" }
    };
%>

<main aria-label="Offer" class="view hero">
    <div id="main" class="view__anchor"></div>
    <div class="view__in hero__in">
        <div class="hero__group">
            <div id="hero-carousel" class="hero__picture carousel">
                <picture class="carousel__item" style="--arp:380/558;--arp-max:380px">
                    <img src="/images/hoover-smart-wash-pet-1.jpg" alt="">
                </picture>
                <picture class="carousel__item" style="--arp:380/558;--arp-max:380px" data-src-img="/images/hoover-smart-wash-pet-2.jpg">
                    <noscript>
                        <img src="/images/hoover-smart-wash-pet-2.jpg" alt="">
                    </noscript>
                </picture>
            </div>
            <% if (isDesktop) { %>
            <div class="hero__bg" data-src-img="/images/desktop/bg_splash--main.png">
                <noscript>
                    <img src="/images/desktop/bg_splash--main.png" alt="">
                </noscript>
            </div>
            <% } %>
            <div class="hero__offer">
                <%= Html.Partial("OfferGroup", new ViewDataDictionary { 
                    { "modifier", "deal--hero" }, 
                    { "id", "hero" } 
                }) %>
                <strong class="hero__shipping">Includes <span>Free Shipping</span></strong>
                <%--<%= Html.Partial("GetPhoneByDomain", callToOrderNumber) %>--%>

                <picture class="hero__savings" style="--arp:300/59;--arp-max:345px">
                    <img src="/images/savings-banner.svg" alt="Over $100 in savings!">
                </picture>
                
                <div class="hero__burst">
                    <picture class="hero__warranty">
                        <img src="/images/burst-warranty.png" alt="Premium 5 year warranty">
                    </picture>
                    <picture class="hero__mbg">
                        <img src="/images/burst-mbg.png" alt="30 day money back guarantee">
                    </picture>
                </div>
            </div>
            <div class="hero__addons addons">
                <div class="addons__section">
                    <div class="banner">You will receive</div>
                    <div class="slide">
                        <div id="addons-slide" class="addons__group slide__into">
                            <figure class="addons__item addons__spot-chaser">
                                <picture style="--arp:243/85;--arp-max:243px">
                                    <img src="/images/spot-chaser.jpg" aria-labelledby="addons-spot-chaser">
                                </picture>
                                <figcaption id="addons-spot-chaser"><%= Products.SPOTWAND %></figcaption>
                            </figure>
                            <figure class="addons__item addons__pet-tool">
                                <picture style="--arp:91/102;--arp-max:91px">
                                    <img src="/images/pretreat-wand.jpg" aria-labelledby="addons-pet-tool">
                                </picture>
                                <figcaption id="addons-pet-tool"><%= Products.PETTOOL %></figcaption>
                            </figure>
                            <figure class="addons__item addons__pet-solution">
                                <picture style="--arp:80/95;--arp-max:80px">
                                    <img src="/images/solution.jpg" aria-labelledby="addons-pet-solution">
                                </picture>
                                <figcaption id="addons-pet-solution">
                                    <span>6 oz Pre-Treat Solution</span> 
                                    <span>6 oz <%= Products.PAWSCLAWS %> Solution</span>
                                </figcaption>
                            </figure>
                        </div>
                        <!-- <span class="addons__bag">Hose &amp; Accessory Bag Included</span> -->
                        <nav aria-label="Addons previous and next slides" class="addons__nav slide__nav">
                            <button
                                id="slide-prev" 
                                aria-label="Select the previous slide"
                                class="slide__prev"
                                type="button"
                            >
                                <span class="icon-chevron-thin-left"></span>
                            </button>
                            <button
                                id="slide-next" 
                                aria-label="Select the next slide"
                                class="slide__next"
                                type="button"
                            >
                                <span class="icon-chevron-thin-right"></span>
                            </button>
                        </nav>
                    </div>
                </div>

                <div class="addons__section">
                    <div class="addons__bonus bonus">
                        <picture class="bonus__savings" style="--arp:102/101;--arp-max:102px">
                            <img src="/images/savings-burst.svg" alt="Over $100 Value">
                        </picture>
                        <div class="bonus__in">
                            <div class="banner"><span>Plus bonus items</span></div>
                        </div>
                        <div class="bonus__group">
                            <figure class="bonus__item bonus__clean-complements">
                                <picture style="--arp:62/93;--arp-max:62px">
                                    <img src="/images/clean-complements-bonus.png" aria-labelledby="clean-complements-solution">
                                </picture>
                                <figcaption id="bonus-solution" style="color: white;">
                                    <span>2 oz Clean Complements&trade;</span><br>
                                    <span>Odor Eliminator</span></figcaption>
                            </figure>
                            <figure class="bonus__item bonus__solution">
                                <picture style="--arp:159/207;--arp-max:159px">
                                    <img src="/images/solutions-bonus.png" aria-labelledby="bonus-solution">
                                </picture>
                                <figcaption id="bonus-solution">
                                    <span>64 oz <%= Products.PAWSCLAWS %> Solution</span>
                                    <span>32 oz Pre-Treat Solution</span></figcaption>
                            </figure>
                            <figure class="bonus__item bonus__tools-brush">
                                <picture style="--arp:193/161;--arp-max:193px">
                                    <img src="/images/tools-brush-bonus.png" aria-labelledby="bonus-tools-brush">
                                </picture>
                                <figcaption id="bonus-tools-brush">Wide Stair Tool, Crevice Tool &amp; SpinScrub Scrubbing Brush</figcaption>
                            </figure>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<section aria-labelledby="media-title" class="view view--photo view--media media">
    <picture style="--arp:2000/693" data-src-img="/images/bg-banner-1.jpg">
        <noscript>
            <img src="/images/bg-banner-1.jpg" alt="">
        </noscript>
    </picture>
    <div id="media" class="view__anchor"></div>
    <div class="view__in media__in">
        <div class="media__group">
            <div class="media__title media__item">
                <h2 id="media-title">
                    <span>Auto Mix. Auto Clean. Auto Dry.</span> 
                    <span>Carpet Cleaning Made Easy.</span>
                </h2>
            </div>
            <div class="media__player media__item">
                <div class="media__video" data-src-iframe="https://player.vimeo.com/video/412549639?dnt=1" style="--arp:630/354;" data-attr='{ "width": "630", "height": "354", "allow": "fullscreen"}'></div>
                <nav aria-label="Video playlist">
                    <button id="video-the-show" class="button" data-video-id="412549639">The Show</button>
                    <button id="video-how-it-works" class="button" data-video-id="412550208">How It Works</button>
                    <button id="video-real-demos" class="button" data-video-id="412548917">Real Demos</button>
                    <button id="video-testimonials" class="button" data-video-id="412549257">Set In Stains</button>
                </nav>
            </div>
        </div>
    </div>
</section>

<section aria-label="Features and benefits" class="view view--product view--observe">
    <div id="features" class="view__anchor"></div>
    <div class="view__in">
        <div class="copy copy--title">
            <h2>The <%= Brand.SMARTWASH %> You Love, Now Even Better</h2>

            <figure class="copy__group">
                <nav aria-label="Product features and benefits" class="product product--figure">
                    <div class="product__picture">
                        <picture style="--arp:376/652;--arp-max:376px" data-src-img="/images/hoover-smart-wash-pet.jpg">
                            <noscript>
                                <img src="/images/hoover-smart-wash-pet.jpg" alt="">
                            </noscript>
                        </picture>
                        <%= Html.Partial("_Perks", new ViewDataDictionary { { "applyButtons", true } }) %>
                    </div>
                </nav>
                <div class="product product--list">
                    <h3>Features and Benefits</h3>
                    <%= Html.Partial("_Perks") %>
                    <% if (isMobile) { %>
                       <%= Html.Partial("_Perks", new ViewDataDictionary { { "applyId", false }, { "modifier", "product__list--static" } }) %>    
                    <% } %>
                </div>
            </figure>
        </div>
    </div>
</section>

<picture class="view view--photo" style="--arp:2000/746" data-src-img="/images/bg-banner-2.jpg" data-tag='{ "source" : [{ "media" : "(max-width: 600px)", "srcset" : "/images/mobile/bg-banner-2.jpg" }, { "media" : "(min-width: 601px)", "srcset" : "/images/bg-banner-2.jpg" }]}'>
    <noscript>
        <img src="/images/bg-banner-2.jpg" alt="">
    </noscript>
</picture>

<section aria-label="Pet mess solutions exclusively from <%= Brand.HVR %>" class="view view--addons">
    <div id="offers" class="view__anchor"></div>
    <div class="view__in">
        <div class="copy">
            <h2>Pet mess solutions exclusively from <%= Brand.HVR %></h2>

            <div class="copy__group">
                <figure class="copy__carousel">
                    <div id="carousel-1" class="carousel">
                        <picture class="carousel__item" style="--arp:350/273;--arp-max:350px" data-src-img="/images/spot-chaser-slide-1.jpg">
                            <noscript>
                                <img src="/images/spot-chaser-slide-1.jpg" alt="">
                            </noscript>
                        </picture>
                        <picture class="carousel__item" style="--arp:350/273;--arp-max:350px" data-src-img="/images/spot-chaser-slide-2.jpg">
                            <noscript>
                                <img src="/images/spot-chaser-slide-2.jpg" alt="">
                            </noscript>
                        </picture>
                    </div>
                    <figcaption>
                        <h3><%= Products.SPOTCHASER %></h3>
                        <p>Simply remove the <%= Products.SPOTWAND %> to target tough stains anywhere.</p>
                    </figcaption>
                </figure>
                <figure class="copy__carousel">
                    <div id="carousel-2" class="carousel">
                        <picture class="carousel__item" style="--arp:350/273;--arp-max:350px" data-src-img="/images/pet-tool-slide-1.jpg">
                            <noscript>
                                <img src="/images/pet-tool-slide-1.jpg" alt="">
                            </noscript>
                        </picture>
                        <picture class="carousel__item" style="--arp:350/273;--arp-max:350px" data-src-img="/images/pet-tool-slide-2.jpg">
                            <noscript>
                                <img src="/images/pet-tool-slide-2.jpg" alt="">
                            </noscript>
                        </picture>
                    </div>
                    <figcaption>
                        <h3><%= Products.PETTOOL %></h3>
                        <p>Tackle pet messes on carpet, stairs, and furniture with power and precision.</p>
                    </figcaption>
                </figure>
                <figure class="copy__carousel">
                    <div id="carousel-3" class="carousel">
                        <picture class="carousel__item" style="--arp:350/273;--arp-max:350px" data-src-img="/images/pet-solution-slide-1.jpg">
                            <noscript>
                                <img src="/images/pet-solution-slide-1.jpg" alt="">
                            </noscript>
                        </picture>
                        <picture class="carousel__item" style="--arp:350/273;--arp-max:350px" data-src-img="/images/pet-solution-slide-2.jpg">
                            <noscript>
                                <img src="/images/pet-solution-slide-2.jpg" alt="">
                            </noscript>
                        </picture>
                    </div>
                    <figcaption>
                        <h3>Pet Solutions</h3>
                        <p>Attack pet stains and odors with <%= Products.SPOTOXY %> pretreat and <%= Products.PAWSCLAWS %> solution.</p>
                    </figcaption>
                </figure>
            </div>
        </div>
    </div>
</section>

<picture class="view view--photo" style="--arp:1920/459" data-src-img="/images/bg-banner-3.jpg" data-tag='{ "source" : [{ "media" : "(max-width: 600px)", "srcset" : "/images/mobile/bg-banner-3.jpg" }, { "media" : "(min-width: 601px)", "srcset" : "/images/bg-banner-3.jpg" }]}'>
    <noscript>
        <img src="/images/bg-banner-3.jpg" alt="">
    </noscript>
</picture>

<section aria-label="Reviews" class="view view--reviews view--observe">
    <div id="reviews" class="view__anchor"></div>
    <div class="view__in">
        <div class="copy">
            <h2>Product Reviews</h2>

            <div class="copy">
                <div class="slide review">
                    <div class="slide__js">
                        <noscript>
                            <style>
                                .slide__js {
                                    display: none;
                                }
                            </style>
                        </noscript>
                    </div>
                    <div id="reviews-slide" class="slide__into">
                        <div class="slide__item">
                            <blockquote class="review__item">
                                <picture class="review__stars" style="--arp:300/49;--arp-max:300px" data-src-img="/images/stars.svg">
                                    <noscript>
                                        <img src="/images/stars.svg" alt="">
                                    </noscript>
                                </picture>
                                <h3>Dog Owner Lifesaver!</h3>
                                <p>My family has two dogs that have spent a great deal of time indoors since the quarantine. My children are supposed to be watching and caring for them, but alas, they are kids. The result - dog stains galore. GROSS!</p>
                                <p>Not only did this remove the stains, but it also removed the nasty barn smell that was taking over the family room.</p>
                                <p>Finally, we have a clean and fresh smelling family room. Unattended dogos stay outside now.</p>
                                <footer><strong>Photograstalker</strong>, Mission Viejo, CA</footer>
                            </blockquote>
                        </div>
                        <div class="slide__item">
                            <blockquote class="review__item">
                                <picture class="review__stars" style="--arp:300/49;--arp-max:300px" data-src-img="/images/stars.svg">
                                    <noscript>
                                        <img src="/images/stars.svg" alt="">
                                    </noscript>
                                </picture>
                                <h3>Adulting is hard, this makes it so much easier!!</h3>
                                <p>As a parent to 4 four-legged furry children who insist on dispersing mud, vomit, hair balls and any other "presents" this vacuum has been a total game changer. My previous shampooers always left wet spots that seemed to take days to dry. With the dry only button on this vacuum, that's been eliminated. The front console is very easy to take off and rinse out if hair builds up. It's also easy to access the brushes to do the same. Highly recommend.</p>
                                <footer><strong>ATCBflo129</strong>, Buffalo, NY</footer>
                            </blockquote>
                        </div>
                        <div class="slide__item">
                            <blockquote class="review__item">
                                <picture class="review__stars" style="--arp:300/49;--arp-max:300px" data-src-img="/images/stars.svg">
                                    <noscript>
                                        <img src="/images/stars.svg" alt="">
                                    </noscript>
                                </picture>
                                <h3>Absolutely Love!</h3>
                                <p>This machine is AMAZING. I have two dogs and two cats, so there is a lot of paw traffic in and out of the house all the time. It easily cleans up any type of mess. The spot wand is great to presoak while you do the rest of your carpets. It has great suction and powerful scrubbing brushes. The automatic wet and dry feature makes it just as simple as running a regular vacuum. Extremely easy to clean afterward, even with all of the pet hair it pulls out of the carpet. Easy and compact, I would absolutely recommend.</p>
                                <footer><strong>Jacki8996</strong>, Pennsylvania</footer>
                            </blockquote>
                        </div>
                        <div class="slide__item">
                            <blockquote class="review__item">
                                <picture class="review__stars" style="--arp:300/49;--arp-max:300px" data-src-img="/images/stars.svg">
                                    <noscript>
                                        <img src="/images/stars.svg" alt="">
                                    </noscript>
                                </picture>
                                <h3>Thanks best scrubber I've ever tried</h3>
                                <p>My SmartWash PET Complete is hands down the best at home carpet scrubber I've ever used. It is lightweight and easy to push and use. I love that there's no trigger for the soap, you simply push the scrubber forward to wash and backwards to dry. The handle even comes off and becomes a battery powered pre-treat wand. I'm in awe over how clean and fresh my carpets look and smell.</p>
                                <footer><strong>Axman</strong>, Beaver Falls</footer>
                            </blockquote>
                        </div>
                        <div class="slide__item">
                            <blockquote class="review__item">
                                <picture class="review__stars" style="--arp:300/49;--arp-max:300px" data-src-img="/images/stars.svg">
                                    <noscript>
                                        <img src="/images/stars.svg" alt="">
                                    </noscript>
                                </picture>
                                <h3>Works great!</h3>
                                <p>This works better than the rental machine I always use, it's easy to use and the attachment for the furniture actually works, not like others I have used in the past, love that it came with a bag to hold the hose and it's easy to clean after use</p>
                                <footer><strong>Dee339</strong>, Ray, MI</footer>
                            </blockquote>
                        </div>
                    </div>
                    <nav aria-label="Reviews previous and next slides" class="slide__nav">
                        <button
                            id="slide-prev" 
                            aria-label="Select the previous slide"
                            class="slide__prev"
                            type="button"
                        >
                            <span class="icon-chevron-thin-left"></span>
                        </button>
                        <button
                            id="slide-next" 
                            aria-label="Select the next slide"
                            class="slide__next"
                            type="button"
                        >
                            <span class="icon-chevron-thin-right"></span>
                        </button>
                    </nav>
                </div>
            </div>

            <a href="Reviews<%= ext %>" id="index-reviews"  class="button">
                <span>More Reviews</span>
            </a>
        </div>
    </div>
</section>

<section aria-label="Frequently asked questions" class="view">
    <div id="faq" class="view__anchor"></div>
    <div class="view__in">
        <div class="copy" itemscope itemtype="https://schema.org/FAQPage">
			<h2>Frequently Asked Questions</h2>

			<div class="copy" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
				<h3 itemprop="name">How often should I deep clean my carpets with the <%= Brand.HVRSMART %>?</h3>
				<p itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
					<span itemprop="text">We recommend deep cleaning 2-4 times per year. In addition to routine spring cleaning and holiday cleaning, <%= Brand.SMARTWASH %> is great for cleaning high-traffic areas, stairs, upholstery and those inevitable spots and spills.</span>
				</p>
			</div>

			<div class="copy" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
				<h3 itemprop="name">Can the <%= Brand.HVRSMART %> clean furniture?</h3>
				<p itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
					<span itemprop="text">Yes! Your <%= Brand.SMARTWASH %> comes with an 8-foot hose and various tools to clean stains and spills on upholstered furniture. Always check manufacturer's label before cleaning for any specific instructions. Before you clean, test a small hidden area of carpet for color fastness. If color changes, do not use.</span>
				</p>
			</div>

			<div class="copy" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
				<h3 itemprop="name">How much cleaning solution do I need when using my <%= Brand.SMARTWASH %>?</h3>
				<p itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
					<span itemprop="text">The great thing about the <%= Brand.SMARTWASH %> is there is NO measuring to do! Simply fill the Solution Tank with <%= Brand.HVR %> cleaning solution and the <%= Brand.SMARTWASH %> takes care of all the mixing and measuring, it's that easy!</span>
				</p>
			</div>

            <a href="FAQ<%= ext %>" id="index-faq"  class="button">
                <span>More Frequently Asked Questions</span>
            </a>
        </div>
        <div class="view__disclaimer">
            <% Html.RenderSnippet("OFFERDETAILS"); %>
        </div>
    </div>
</section>

</asp:Content>