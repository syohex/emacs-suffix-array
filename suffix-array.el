;;; suffix-array.el --- Simple suffix-array implementation -*- lexical-binding: t; -*-

;; Copyright (C) 2017 by Syohei YOSHIDA

;; Author: Syohei YOSHIDA <syohex@gmail.com>
;; URL: https://github.com/syohex/
;; Version: 0.01
;; Package-Requires: ((emacs "24") (cl-lib "0.5"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Very simple suffix array implementation

;;; Code:

(require 'cl-lib)

(defun suffix-array--substring-index (str)
  (let ((len (length str)))
    (cl-loop for i from 0 to (1- len)
             collect (cons (substring str i len) i))))

;;;###autoload
(defun suffix-array (str)
  (interactive)
  (let* ((substr-indices (suffix-array--substring-index str))
         (sorted (sort substr-indices (lambda (a b)
                                        (string< (car a) (car b))))))
    (mapcar #'cdr sorted)))

(provide 'suffix-array)

;;; suffix-array.el ends here
