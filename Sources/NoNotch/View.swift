/*

 MIT License

 Copyright (c) 2016 Maxim Khatskevich (maxim@khatskevi.ch)

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.

 */

import UIKit

import SnapKit

//---

public
class NoNotchView: UIView
{
    public
    let contentView = UIView()

    //---

    public
    override
    init(frame: CGRect)
    {
        super.init(frame: frame)

        //--- hierarchy

        addSubview(
            contentView
        )

        //--- layout

        contentView.snp.makeConstraints {

            if
                #available(iOS 11.0, *)
            {
                // TODO: How to react on changing status bar height?
                $0.top
                    .equalTo(self.safeAreaLayoutGuide.snp.top)
                    .offset((type(of: self).isScreenWithNotch ? -10 : 0))
                $0.leading.trailing.bottom
                    .equalToSuperview()
            }
            else
            {
                // TODO: How to react on changing status bar height?
                $0.top
                    .equalToSuperview()
                    .offset(UIApplication.shared.statusBarFrame.height)
                $0.leading.trailing.bottom
                    .equalToSuperview()
            }
        }

        //--- other settings

        backgroundColor = .black

        contentView.backgroundColor = .white
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = type(of: self).appAreaCornerRadius
    }

    public
    required
    init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}

// MARK: - Public helpers

public
extension NoNotchView
{
    static
    var isScreenWithNotch: Bool
    {
        // is iPhoneX screen?
        return UIScreen.main.bounds.size
            == CGSize(width: 375, height: 812)
    }

    static
    var appAreaCornerRadius: CGFloat
    {
        return isScreenWithNotch ? 22 : 8
    }
}

// MARK: - Internal helpers

extension NoNotchView
{
    func embed(_ nestedView: UIView)
    {
        contentView.addSubview(nestedView)

        //---

        nestedView.snp.makeConstraints {

            $0.edges.equalToSuperview()
        }
    }
}
