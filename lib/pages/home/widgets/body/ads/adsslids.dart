import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'adsmodels.dart';

class AdsSlider extends StatefulWidget {
  final List<AdSlide> ads;
  final double height;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final EdgeInsetsGeometry padding;
  final Function(int)? onPageChanged;
  final Function(AdSlide)? onAdTap;

  const AdsSlider({
    super.key,
    required this.ads,
    this.height = 180,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
    this.onPageChanged,
    this.onAdTap,
  });

  @override
  State<AdsSlider> createState() => _AdsSliderState();
}

class _AdsSliderState extends State<AdsSlider> {
  int _currentIndex = 0;

  void _handlePageChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentIndex = index;
    });
    if (widget.onPageChanged != null) {
      widget.onPageChanged!(index);
    }
  }

  void _handleAdTap(AdSlide ad) {
    if (widget.onAdTap != null) {
      widget.onAdTap!(ad);
    }
    // يمكن إضافة تحليلات أو أحداث هنا في المستقبل
  }

  @override
  Widget build(BuildContext context) {
    if (widget.ads.isEmpty) {
      return _buildEmptyState();
    }

    return Padding(
      padding: widget.padding,
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: widget.ads.length,
            options: CarouselOptions(
              height: widget.height,
              autoPlay: widget.autoPlay,
              autoPlayInterval: widget.autoPlayInterval,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              onPageChanged: _handlePageChanged,
            ),
            itemBuilder: (context, index, realIndex) {
              final ad = widget.ads[index];
              return _buildAdItem(ad);
            },
          ),
          const SizedBox(height: 12),
          _buildPageIndicator(),
        ],
      ),
    );
  }

  Widget _buildAdItem(AdSlide ad) {
    return GestureDetector(
      onTap: () => _handleAdTap(ad),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            ad.image,
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Image(
                  image: AssetImage('assets/images/hadjADS.png'),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: _currentIndex,
      count: widget.ads.length,
      effect: const WormEffect(
        dotHeight: 8,
        dotWidth: 8,
        spacing: 8,
        dotColor: Color(0xFFE0E0E0),
        activeDotColor: Color(0xFFFF7F00),
        paintStyle: PaintingStyle.fill,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      height: widget.height,
      margin: widget.padding,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.photo_library, color: Colors.grey, size: 40),
            SizedBox(height: 8),
            Text(
              'لا توجد إعلانات حالياً',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget مساعد لاستخدام الإعلانات الافتراضية
class DefaultAdsSlider extends StatelessWidget {
  final double height;
  final bool autoPlay;

  const DefaultAdsSlider({super.key, this.height = 180, this.autoPlay = true});

  @override
  Widget build(BuildContext context) {
    return AdsSlider(
      ads: AdsRepository.defaultAds,
      height: height,
      autoPlay: autoPlay,
    );
  }
}
